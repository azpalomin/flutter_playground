import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_shared/constants/ui/size_constants.dart';
import 'package:flutter_shared/widgets/containers/bouncy_container.dart';

class BouncyPage extends StatelessWidget {
  final Widget? bottom;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final bool isBouncy;
  final MainAxisAlignment mainAxisAlignment;
  final Alignment pageAlignment;
  final double? maxWidth;
  final EdgeInsets padding;
  final ScrollController? scrollController;
  final bool showBackground;
  final bool showBottomOnScroll;
  final bool showBottomSafeArea;
  final bool showTopOnScroll;
  final bool showTopSafeArea;
  final Widget? top;
  final BoxDecoration? gradientBackgroundColor;
  final bool isTopCustomWidget;

  const BouncyPage({
    super.key,
    this.bottom,
    this.children = const [],
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.pageAlignment = Alignment.center,
    this.isBouncy = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.maxWidth = defaultMaxWidth,
    this.padding = const EdgeInsets.all(16),
    this.scrollController,
    this.showBackground = true,
    this.showBottomOnScroll = false,
    this.showBottomSafeArea = true,
    this.showTopOnScroll = true,
    this.showTopSafeArea = true,
    this.top,
    this.gradientBackgroundColor,
    this.isTopCustomWidget = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: gradientBackgroundColor ??
          BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
      child: Stack(
        children: [
          // Add background here
          SafeArea(
            bottom: false,
            top: false,
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              appBar: !showTopOnScroll && top == null && !isTopCustomWidget
                  ? AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: showTopOnScroll ? null : top,
                    )
                  : null,
              body: BouncyContainer(
                isTopNonScrollableWidget: isTopCustomWidget,
                alignment: pageAlignment,
                bottom: showBottomOnScroll ? bottom : null,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                mainAxisAlignment: mainAxisAlignment,
                maxWidth: maxWidth,
                padding: padding,
                scrollController: scrollController,
                showBottomSafeArea: showBottomOnScroll || bottom == null ? showBottomSafeArea : false,
                showTopSafeArea: showTopOnScroll || top == null ? showTopSafeArea : false,
                top: showTopOnScroll ? top : null,
                children: children,
              ),
              bottomNavigationBar: showBottomOnScroll || bottom == null
                  ? null
                  : Padding(
                      padding: EdgeInsets.only(
                        bottom: (showBottomSafeArea ? max(MediaQuery.of(context).viewPadding.bottom, 16) : 0),
                      ),
                      child: bottom,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
