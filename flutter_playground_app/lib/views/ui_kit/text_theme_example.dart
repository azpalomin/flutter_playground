import 'package:flutter/material.dart';

class TextThemeExample extends StatelessWidget {
  const TextThemeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Headline Large', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(width: 16),
            Text('Headline Medium', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(width: 16),
            Text('Headline Small', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Text('Display Large', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(width: 16),
            Text('Display Medium', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(width: 16),
            Text('Display Small', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Text('Title Large', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(width: 16),
            Text('Title Medium', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 16),
            Text('Title Small', style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Text('Body Large', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(width: 16),
            Text('Body Medium', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(width: 16),
            Text('Body Small', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Text('Label Large', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(width: 16),
            Text('Label Medium', style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(width: 16),
            Text('Label Small', style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ],
    );
  }
}
