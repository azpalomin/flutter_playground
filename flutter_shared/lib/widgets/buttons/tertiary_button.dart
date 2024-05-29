import 'package:flutter/material.dart';
import 'package:flutter_shared/widgets/buttons/rounded_button.dart';

class TertiaryButton extends StatelessWidget {
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

  const TertiaryButton({
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
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      disabled: disabled,
      expandable: expandable,
      icon: icon,
      iconColor: iconColor,
      iconStart: iconStart,
      mainAxisAlignment: mainAxisAlignment,
      onPressed: onPressed,
      pill: pill,
      text: text,
      textColor: Theme.of(context).colorScheme.onTertiary,
      width: width,
      child: child,
    );
  }
}
