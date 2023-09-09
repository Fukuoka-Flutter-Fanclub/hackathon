import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

const home = '/home';
const login = '/login';
const signin = '/signin';
const reset = '/reset';

final routerProvider = Provider(
  (ref) => GoRouter(
    debugLogDiagnostics: true,
    initialLocation: home,
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: login,
        name: login,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            NoTransitionPage(key: state.pageKey, child: Container()),
      ),
      GoRoute(
        path: signin,
        name: signin,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            NoTransitionPage(key: state.pageKey, child: Container()),
      ),
      GoRoute(
        path: reset,
        name: reset,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            NoTransitionPage(key: state.pageKey, child: Container()),
      ),
      GoRoute(
        path: home,
        name: home,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            NoTransitionPage(key: state.pageKey, child: Container()),
      ),
    ],
    errorPageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: Container(),
    ),
  ),
);
