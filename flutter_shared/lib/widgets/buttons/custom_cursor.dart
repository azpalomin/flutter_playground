import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CustomCursor extends StatelessWidget {
  final HitTestBehavior behavior;
  final SystemMouseCursor cursor;
  final VoidCallback? onTap;
  final Widget child;

  const CustomCursor({
    super.key,
    this.behavior = HitTestBehavior.opaque,
    this.cursor = SystemMouseCursors.click,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: cursor,
      child: GestureDetector(
        behavior: behavior,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
