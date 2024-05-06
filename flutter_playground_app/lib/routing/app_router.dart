import 'package:auto_route/auto_route.dart';
import 'package:flutter_playground/views/infinite_loadiing/infinite_loading_view.dart';
import 'package:flutter_playground/views/ui_kit/ui_kit_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: UiKit.page,
          path: '/ui-kit',
        ),
        AutoRoute(
          initial: true,
          page: InfiniteLoading.page,
        )
      ];
}
