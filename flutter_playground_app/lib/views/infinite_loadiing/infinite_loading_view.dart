import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/models/stock_data_entry.dart';
import 'package:flutter_playground/services/data/stock_data_service.dart';
import 'package:flutter_shared/widgets/containers/page_container.dart';
import 'package:flutter_shared/widgets/lists/infinite_list_builder.dart';

@RoutePage(name: 'InfiniteLoading')
class InfiniteLoadingView extends StatefulWidget {
  const InfiniteLoadingView({super.key});

  @override
  State<InfiniteLoadingView> createState() => _InfiniteLoadingViewState();
}

class _InfiniteLoadingViewState extends State<InfiniteLoadingView> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Apple Stock Data',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: InfiniteListBuilder(
        endOfListItem: const ListTile(
          title: Text('No More items'),
        ),
        errorItem: (fetchAgain) {
          return const ListTile(
            title: Text('Error occured'),
          );
        },
        fetch: (int offset, int limit) async => await StockDataService.getData(
          offset: offset,
          limit: limit,
        ),
        initialRequestLimit: 30,
        listItem: (dynamic value) {
          StockDataEntry entry = value as StockDataEntry;
          return ListTile(
            leading: Text(
              entry.date.toString(),
            ),
            title: Text(
              'Open: ${entry.open} - Close: ${entry.close}',
            ),
            subtitle: Text(
              'High: ${entry.high} Low: ${entry.low}',
            ),
            trailing: Text('Volume: ${entry.volume}'),
          );
        },
        perRequest: 10,
        triggerPoint: 5,
      ),
    );
  }
}
