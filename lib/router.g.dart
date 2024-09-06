// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $formRoute,
      $longListRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $formRoute => GoRouteData.$route(
      path: '/form',
      factory: $FormRouteExtension._fromState,
    );

extension $FormRouteExtension on FormRoute {
  static FormRoute _fromState(GoRouterState state) => const FormRoute();

  String get location => GoRouteData.$location(
        '/form',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $longListRoute => GoRouteData.$route(
      path: '/long-list',
      factory: $LongListRouteExtension._fromState,
    );

extension $LongListRouteExtension on LongListRoute {
  static LongListRoute _fromState(GoRouterState state) => const LongListRoute();

  String get location => GoRouteData.$location(
        '/long-list',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
