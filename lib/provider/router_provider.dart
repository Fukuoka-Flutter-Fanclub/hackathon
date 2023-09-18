import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/core/exceptions/invalid_route_arg_exception.dart';
import 'package:hackathon/features/home/home_page.dart';
import 'package:hackathon/features/my_page/my_page.dart';
import 'package:hackathon/features/sample/sample_next_page.dart';
import 'package:hackathon/features/sample/sample_page.dart';
import 'package:hackathon/features/time_line/time_line_screen.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    debugLogDiagnostics: true,
    initialLocation: HomePage.routeName,
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: HomePage.routeName,
        name: HomePage.routeName,
        builder: (_, __) => const HomePage(),
        routes: [
          GoRoute(
            path: MyPage.routeName,
            name: MyPage.routeName,
            builder: (_, state) {
              final arg = state.extra;
              if (arg is MyPageArg) {
                return MyPage(arg);
              }
              throw InvalidRouteArgException(
                routeName: MyPage.routeName,
                arg: arg,
              );
            },
          ),
          GoRoute(
            path: SamplePage.routeName,
            name: SamplePage.routeName,
            builder: (_, __) => const SamplePage(),
            routes: [
              GoRoute(
                path: SampleNextPage.routeName,
                name: SampleNextPage.routeName,
                builder: (_, __) => const SampleNextPage(),
              ),
            ],
          ),
          GoRoute(
            path: TimeLineScreen.routeName,
            name: TimeLineScreen.routeName,
            builder: (_, __) => const TimeLineScreen(),
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: Container(),
    ),
  ),
);
