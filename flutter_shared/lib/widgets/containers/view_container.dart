import 'package:flutter/material.dart';
import 'package:flutter_shared/constants/ui/size_constants.dart';

class ViewContainer extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final double maxWidth;
  final bool showBackground;
  final bool showBottomSafeArea;
  final bool showTopSafeArea;

  const ViewContainer({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.drawer,
    this.maxWidth = defaultMaxWidth,
    this.showBackground = true,
    this.showBottomSafeArea = true,
    this.showTopSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Stack(
        children: [
          // Can add background here.
          SafeArea(
            bottom: bottomNavigationBar == null ? false : showBottomSafeArea,
            top: appBar == null ? false : showTopSafeArea,
            child: Scaffold(
              appBar: appBar,
              backgroundColor: Colors.transparent,
              bottomNavigationBar: bottomNavigationBar,
              drawer: drawer,
              resizeToAvoidBottomInset: true,
              body: Container(
                constraints: BoxConstraints(
                  maxWidth: maxWidth,
                ),
                padding: EdgeInsets.only(
                  bottom: bottomNavigationBar == null && showBottomSafeArea
                      ? MediaQuery.of(context).viewInsets.bottom + MediaQuery.of(context).viewPadding.bottom
                      : 0,
                  top: appBar == null && showTopSafeArea
                      ? MediaQuery.of(context).viewPadding.top + MediaQuery.of(context).padding.top
                      : 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: body,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
