import 'package:flutter/material.dart';
import 'package:flutter_shared/widgets/buttons/rounded_button.dart';

class SecondaryButton extends StatelessWidget {
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
  final TextStyle? textStyle;
  final double? width;

  const SecondaryButton({
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
    this.textStyle,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      disabled: disabled,
      expandable: expandable,
      icon: icon,
      iconColor: iconColor,
      iconStart: iconStart,
      mainAxisAlignment: mainAxisAlignment,
      onPressed: onPressed,
      pill: pill,
      text: text,
      textColor: textStyle == null ? Theme.of(context).colorScheme.onSecondary : null,
      textStyle: textStyle,
      width: width,
      child: child,
    );
  }
}
