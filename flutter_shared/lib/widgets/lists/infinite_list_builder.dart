import 'package:flutter/material.dart';

class InfiniteListBuilder extends StatefulWidget {
  final Widget endOfListItem;
  final Widget Function(Future<void> Function()) errorItem;
  final Future<List<dynamic>> Function(int offset, int limit) fetch;
  final int initialRequestLimit;
  final Widget Function(dynamic) listItem;
  final int perRequest;
  final int triggerPoint;

  const InfiniteListBuilder({
    super.key,
    required this.endOfListItem,
    required this.errorItem,
    required this.fetch,
    required this.initialRequestLimit,
    required this.listItem,
    required this.perRequest,
    required this.triggerPoint,
  });

  @override
  State<InfiniteListBuilder> createState() => _InfiniteListBuilderState();
}

class _InfiniteListBuilderState extends State<InfiniteListBuilder> {
  List<dynamic>? _data;
  bool _isLoading = true;
  bool _hasError = false;
  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    if (_data == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: _data!.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == _data!.length) {
          if (_isLoading) {
            return const Padding(
              padding: EdgeInsets.all(8),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (_hasError) {
            return widget.errorItem(() async {
              setState(() {
                _isLoading = true;
                _hasError = false;
              });
              await _fetch(_data!.length, widget.perRequest);
            });
          }
          if (_isLastPage) {
            return widget.endOfListItem;
          }
        }

        if (!_isLastPage && !_hasError && !_isLoading && _data!.length - widget.triggerPoint == index) {
          _fetch(_data!.length, widget.perRequest);
        }

        return widget.listItem(_data![index]);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _fetch(0, widget.initialRequestLimit);
  }

  Future<void> _fetch(int offset, int limit) async {
    _hasError = false;
    _isLoading = true;
    try {
      List<dynamic> list = await widget.fetch(offset, limit);
      setState(() {
        _data ??= [];
        _data!.addAll(list);
        _isLastPage = list.length < limit;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _data ??= [];
        _hasError = true;
        _isLoading = false;
      });
    }
  }
}
