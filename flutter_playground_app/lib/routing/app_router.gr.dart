// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    InfiniteLoading.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InfiniteLoadingView(),
      );
    },
    UiKit.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UiKitView(),
      );
    },
  };
}

/// generated route for
/// [InfiniteLoadingView]
class InfiniteLoading extends PageRouteInfo<void> {
  const InfiniteLoading({List<PageRouteInfo>? children})
      : super(
          InfiniteLoading.name,
          initialChildren: children,
        );

  static const String name = 'InfiniteLoading';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UiKitView]
class UiKit extends PageRouteInfo<void> {
  const UiKit({List<PageRouteInfo>? children})
      : super(
          UiKit.name,
          initialChildren: children,
        );

  static const String name = 'UiKit';

  static const PageInfo<void> page = PageInfo<void>(name);
}
