import 'package:flutter/cupertino.dart';

class AllBouncyContainer extends StatelessWidget {
  final List<Widget> children;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final double minWidth;

  const AllBouncyContainer({
    super.key,
    required this.children,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    required this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight + 1,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: constraints.maxWidth > minWidth ? constraints.maxWidth : minWidth + 1,
                child: Column(
                  children: children,
                ), // Replace with your widget
              ),
            ),
          ),
        );
      },
    );
  }
}
