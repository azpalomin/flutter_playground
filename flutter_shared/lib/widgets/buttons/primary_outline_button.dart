import 'package:flutter/material.dart';
import 'package:flutter_shared/widgets/buttons/rounded_button.dart';

class PrimaryOutlineButton extends StatelessWidget {
  final Widget? child;
  final bool disabled;
  final bool expandable;
  final IconData? icon;
  final Color? iconColor;
  final bool iconStart;
  final MainAxisAlignment mainAxisAlignment;
  final VoidCallback onPressed;
  final bool pill;
  final String text;
  final double? width;

  const PrimaryOutlineButton({
    super.key,
    this.child,
    this.disabled = false,
    this.expandable = true,
    this.icon,
    this.iconColor,
    this.iconStart = true,
    this.mainAxisAlignment = MainAxisAlignment.center,
    required this.onPressed,
    this.pill = true,
    required this.text,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      backgroundColor: Theme.of(context).colorScheme.background,
      disabled: disabled,
      expandable: expandable,
      icon: icon,
      iconColor: iconColor,
      iconStart: iconStart,
      mainAxisAlignment: mainAxisAlignment,
      onPressed: onPressed,
      outlineColor: Theme.of(context).colorScheme.primary,
      pill: pill,
      text: text,
      textColor: Theme.of(context).colorScheme.onBackground,
      width: width,
      child: child,
    );
  }
}
