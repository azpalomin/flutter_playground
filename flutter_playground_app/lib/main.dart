import 'package:flutter/material.dart';
import 'package:flutter_playground/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shared/providers/utils/app_theme_provider.dart';
import 'package:flutter_shared/theming/dark_theme.dart';
import 'package:flutter_shared/theming/light_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  App({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      darkTheme: darkTheme,
      theme: lightTheme,
      routerConfig: _appRouter.config(),
      themeMode: ref.watch(appThemeProvider),
      title: 'Flutter Playground',
    );
  }
}
