import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'modules/form/form.dart';
import 'modules/home/home.dart';
import 'modules/long_list/ui/long_list_page.dart';
import 'modules/tab_home/tab_home.dart';

part 'router.g.dart';

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<FormRoute>(path: '/form')
class FormRoute extends GoRouteData {
  const FormRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FormPage();
  }
}

@TypedGoRoute<LongListRoute>(path: '/long-list')
class LongListRoute extends GoRouteData {
  const LongListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LongListPage();
  }
}

@TypedGoRoute<TabHomeRoute>(path: '/tab-home')
class TabHomeRoute extends GoRouteData {
  const TabHomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TabHomePage();
  }
}
