import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/views/views/ui_kit/color_scheme_example.dart';
import 'package:flutter_playground/views/views/ui_kit/text_theme_example.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shared/providers/utils/app_theme_provider.dart';
import 'package:flutter_shared/widgets/buttons/basic_button.dart';
import 'package:flutter_shared/widgets/buttons/outline_rounded_button.dart';
import 'package:flutter_shared/widgets/buttons/primary_button.dart';
import 'package:flutter_shared/widgets/buttons/primary_outline_button.dart';
import 'package:flutter_shared/widgets/buttons/secondary_button.dart';
import 'package:flutter_shared/widgets/buttons/tertiary_button.dart';

@RoutePage(name: 'ui-kit')
class CustomUIKitView extends ConsumerStatefulWidget {
  const CustomUIKitView({super.key});

  @override
  ConsumerState<CustomUIKitView> createState() => _CustomUIKitViewState();
}

class _CustomUIKitViewState extends ConsumerState<CustomUIKitView> {
  bool _pillButton = true;
  bool _disabled = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('UIKitView', style: Theme.of(context).textTheme.displayLarge),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 32),
                Row(
                  children: [
                    Text(
                      'Theme Mode:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(width: 16),
                    ToggleButtons(
                      borderColor: Theme.of(context).colorScheme.outline,
                      isSelected: [
                        ref.watch(appThemeProvider) == ThemeMode.light,
                        ref.watch(appThemeProvider) == ThemeMode.dark,
                        ref.watch(appThemeProvider) == ThemeMode.system,
                      ],
                      onPressed: (int index) {
                        switch (index) {
                          case 0:
                            ref.read(appThemeProvider.notifier).setThemeMode(ThemeMode.light);
                            break;
                          case 1:
                            ref.read(appThemeProvider.notifier).setThemeMode(ThemeMode.dark);
                            break;
                          case 2:
                            ref.read(appThemeProvider.notifier).setThemeMode(ThemeMode.system);
                            break;
                        }
                      },
                      selectedBorderColor: Theme.of(context).colorScheme.primary,
                      children: const [
                        Icon(Icons.light_mode),
                        Icon(Icons.dark_mode_outlined),
                        Icon(Icons.settings_brightness_outlined),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text('Color Scheme:', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16),
                const ColorSchemeExample(),
                const SizedBox(height: 32),
                Text('Text Theme:', style: Theme.of(context).textTheme.titleMedium),
                const TextThemeExample(),
                const SizedBox(height: 32),
                Text(
                  'Widgets:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                ToggleButtons(
                  borderColor: Theme.of(context).colorScheme.outline,
                  isSelected: [_pillButton, !_pillButton],
                  onPressed: (int index) {
                    setState(() {
                      _pillButton = !_pillButton;
                    });
                  },
                  selectedBorderColor: Theme.of(context).colorScheme.primary,
                  children: const [
                    Icon(Icons.circle),
                    Icon(Icons.rectangle_rounded),
                  ],
                ),
                const SizedBox(height: 16),
                ToggleButtons(
                  borderColor: Theme.of(context).colorScheme.outline,
                  isSelected: [!_disabled, _disabled],
                  onPressed: (int index) {
                    setState(() {
                      _disabled = !_disabled;
                    });
                  },
                  selectedBorderColor: Theme.of(context).colorScheme.primary,
                  children: const [
                    Icon(Icons.check_circle),
                    Icon(Icons.cancel),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'BasicButton',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 16),
                    BasicButton(
                      disabled: _disabled,
                      expandable: false,
                      onPressed: () {},
                      pill: _pillButton,
                      text: 'Main button',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'PrimaryButton: ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 16),
                    PrimaryButton(
                      disabled: _disabled,
                      expandable: false,
                      onPressed: () {},
                      pill: _pillButton,
                      text: 'Primary button',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'SecondaryButton Disabled: ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 16),
                    SecondaryButton(
                      disabled: _disabled,
                      expandable: false,
                      onPressed: () {},
                      pill: _pillButton,
                      text: 'Secondary button',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'TerinaryButton: ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 16),
                    TertiaryButton(
                      disabled: _disabled,
                      expandable: false,
                      onPressed: () {},
                      pill: _pillButton,
                      text: 'Terinary button',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text('PrimaryOutlineButton: ', style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(width: 16),
                    PrimaryOutlineButton(
                      disabled: _disabled,
                      expandable: false,
                      onPressed: () {},
                      pill: _pillButton,
                      text: 'Primary Outline button',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text('OutlineButton: ', style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(width: 16),
                    OutlineRoundedButton(
                      disabled: _disabled,
                      expandable: false,
                      onPressed: () {},
                      pill: _pillButton,
                      text: 'Outline button',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text('OutlineButton', style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(width: 16),
                    OutlineRoundedButton(
                      disabled: _disabled,
                      expandable: false,
                      onPressed: () {},
                      pill: _pillButton,
                      selected: true,
                      text: 'Selected: true',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text('BasicButton', style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(width: 16),
                    BasicButton(
                      disabled: _disabled,
                      expandable: false,
                      icon: Icons.search,
                      onPressed: () {},
                      pill: _pillButton,
                      text: 'With Icon',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
