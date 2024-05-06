import 'package:flutter/material.dart';

class BouncyContainer extends StatelessWidget {
  final Widget? bottom;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final bool isBouncy;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final MainAxisAlignment mainAxisAlignment;
  final double? maxWidth;
  final EdgeInsets padding;
  final bool reverse;
  final ScrollController? scrollController;
  final Widget? top;
  final Alignment alignment;
  final bool isKeyboardVisible;
  final bool isTopNonScrollableWidget;
  final bool showBottomSafeArea;
  final bool showTopSafeArea;

  const BouncyContainer({
    super.key,
    this.bottom,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.isBouncy = true,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.maxWidth,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.reverse = false,
    this.scrollController,
    this.top,
    this.alignment = Alignment.center,
    this.isKeyboardVisible = false,
    this.isTopNonScrollableWidget = false,
    this.showBottomSafeArea = false,
    this.showTopSafeArea = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return isTopNonScrollableWidget && top != null
            ? Column(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: maxWidth ?? constraints.maxWidth,
                    ),
                    child: top,
                  ),
                  Expanded(
                    child: buildScroll(
                      context,
                      constraints,
                    ),
                  ),
                ],
              )
            : buildScroll(context, constraints);
      },
    );
  }

  Widget buildScroll(BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: isBouncy ? const BouncingScrollPhysics() : null,
      keyboardDismissBehavior: keyboardDismissBehavior,
      reverse: reverse,
      child: Align(
        alignment: alignment,
        child: Container(
          padding: padding.copyWith(
            bottom:
                showBottomSafeArea ? padding.bottom + MediaQuery.of(context).viewInsets.bottom + 16 : padding.bottom,
            top: showTopSafeArea
                ? padding.top + MediaQuery.of(context).viewInsets.top + MediaQuery.of(context).viewPadding.top
                : padding.top,
          ),
          constraints: BoxConstraints(
            minHeight:
                isKeyboardVisible && scrollController != null ? constraints.maxHeight * 1.3 : constraints.maxHeight + 1,
            maxWidth: maxWidth ?? constraints.maxWidth,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: crossAxisAlignment,
              mainAxisAlignment: mainAxisAlignment,
              children: [
                if (top != null && !isTopNonScrollableWidget) top!,
                if (MainAxisAlignment.end == mainAxisAlignment || MainAxisAlignment.center == mainAxisAlignment)
                  const Spacer(),
                ...children,
                if (MainAxisAlignment.start == mainAxisAlignment || MainAxisAlignment.center == mainAxisAlignment)
                  const Spacer(),
                if (bottom != null) bottom!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
