import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? child;
  final bool disabled;
  final bool expandable;
  final IconData? icon;
  final Color? iconColor;
  final bool iconStart;
  final MainAxisAlignment mainAxisAlignment;
  final VoidCallback? onPressed;
  final Color? outlineColor;
  final bool pill;
  final String? text;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? width;

  const RoundedButton({
    super.key,
    this.backgroundColor,
    this.child,
    this.disabled = false,
    this.expandable = true,
    this.icon,
    this.iconColor,
    this.iconStart = true,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.onPressed,
    this.outlineColor,
    this.pill = true,
    this.text,
    this.textColor,
    this.textStyle,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    assert(textColor == null || textStyle == null); // Either text color or text style must be provided but not both
    assert(child != null || text != null); // Either child or text must be provided but not both
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.onSurface,
        disabledBackgroundColor:
            (backgroundColor ?? Theme.of(context).colorScheme.onSurface).withOpacity(disabled ? .5 : 1),
        elevation: 0,
        minimumSize: Size(width ?? (expandable ? double.infinity : 0), 0),
        maximumSize: Size(width ?? double.infinity, double.infinity),
        padding: EdgeInsets.symmetric(
          horizontal: expandable ? 0 : 24,
          vertical: kIsWeb ? 16 : 8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(pill ? 32 : 8),
          side: outlineColor == null
              ? BorderSide.none
              : BorderSide(
                  color: outlineColor!.withOpacity(disabled ? .5 : 1),
                  width: 3,
                ),
        ),
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: expandable ? MainAxisSize.max : MainAxisSize.min,
        children: [
          if (icon != null && iconStart) ...[
            if (mainAxisAlignment == MainAxisAlignment.start) const SizedBox(width: 16),
            Icon(
              icon,
              color: (iconColor ?? textColor ?? Theme.of(context).colorScheme.surface).withOpacity(
                disabled ? .5 : 1,
              ),
              size: 32,
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: child ??
                Text(
                  text!,
                  style: textStyle ??
                      Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: (textColor ?? Theme.of(context).colorScheme.surface).withOpacity(
                              disabled ? .5 : 1,
                            ),
                          ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
          ),
          if (icon != null && !iconStart) ...[
            const SizedBox(width: 8),
            Icon(
              icon,
              color: (iconColor ?? textColor ?? Theme.of(context).colorScheme.surface).withOpacity(
                disabled ? .5 : 1,
              ),
              size: 32,
            ),
            if (mainAxisAlignment == MainAxisAlignment.end) const SizedBox(width: 16),
          ],
        ],
      ),
    );
  }
}
