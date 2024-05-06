import 'package:flutter/material.dart';

class ColorSchemeExample extends StatelessWidget {
  const ColorSchemeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Text('Primary: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Text('Secondary: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(height: 16),
                Text('Terinary: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ],
            ),
            const SizedBox(width: 32),
            Column(
              children: [
                Text('Background: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.background,
                ),
                const SizedBox(height: 16),
                Text('Surface: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.surface,
                ),
                const SizedBox(height: 16),
                Text('Error: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.error,
                ),
              ],
            ),
            const SizedBox(width: 32),
            Column(
              children: [
                Text('On Background: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                const SizedBox(height: 16),
                Text('On Surface: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(height: 16),
                Text('On Error: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.onError,
                ),
              ],
            ),
            const SizedBox(width: 32),
            Column(
              children: [
                Text('On Primary: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(height: 16),
                Text('On Secondary: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                const SizedBox(height: 16),
                Text('On Tertiary: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
              ],
            ),
            const SizedBox(width: 32),
            Column(
              children: [
                Text('On Surface Variant: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 16),
                Text('Outline: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.outline,
                ),
                const SizedBox(height: 16),
                Text('Outline Variant: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ],
            ),
            const SizedBox(width: 32),
            Column(
              children: [
                Text('Surface Tint: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.surfaceTint,
                ),
                const SizedBox(height: 16),
                Text('Surface Variant: ', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
