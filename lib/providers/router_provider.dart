import 'package:flutter/material.dart';
import 'package:flutter_demo/router.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    routes: $appRoutes,
    initialLocation: '/home',
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => Container(),
  );
}
