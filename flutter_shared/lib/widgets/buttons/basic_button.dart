import 'package:flutter/material.dart';
import 'package:flutter_shared/widgets/buttons/rounded_button.dart';

class BasicButton extends StatelessWidget {
  final Widget? child;
  final bool disabled;
  final bool expandable;
  final IconData? icon;
  final Color? iconColor;
  final bool iconStart;
  final MainAxisAlignment mainAxisAlignment;
  final VoidCallback? onPressed;
  final bool pill;
  final String text;
  final double? width;

  const BasicButton({
    super.key,
    this.child,
    this.disabled = false,
    this.expandable = false,
    this.icon,
    this.iconColor,
    this.iconStart = true,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.onPressed,
    this.pill = true,
    required this.text,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      backgroundColor: Colors.black,
      disabled: disabled,
      expandable: expandable,
      icon: icon,
      iconColor: iconColor,
      iconStart: iconStart,
      mainAxisAlignment: mainAxisAlignment,
      onPressed: onPressed,
      pill: pill,
      text: text,
      textColor: Colors.white,
      width: width,
      child: child,
    );
  }
}
