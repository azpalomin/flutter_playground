import 'package:flutter/material.dart';
import 'package:flutter_shared/widgets/buttons/rounded_button.dart';

class OutlineRoundedButton extends StatelessWidget {
  final Widget? child;
  final bool? disabled;
  final bool expandable;
  final IconData? icon;
  final Color? iconColor;
  final bool iconStart;
  final MainAxisAlignment mainAxisAlignment;
  final VoidCallback onPressed;
  final bool pill;
  final bool selected;
  final String? text;
  final double? width;

  const OutlineRoundedButton({
    super.key,
    this.child,
    this.disabled,
    this.expandable = true,
    this.icon,
    this.iconColor,
    this.iconStart = true,
    this.mainAxisAlignment = MainAxisAlignment.center,
    required this.onPressed,
    this.pill = true,
    this.selected = false,
    this.text,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      backgroundColor: selected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.background,
      disabled: disabled ?? false,
      expandable: expandable,
      icon: icon,
      iconColor: iconColor,
      iconStart: iconStart,
      mainAxisAlignment: mainAxisAlignment,
      onPressed: onPressed,
      outlineColor: Theme.of(context).colorScheme.onBackground,
      pill: pill,
      text: text,
      textColor: selected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onBackground,
      width: width,
      child: child,
    );
  }
}
