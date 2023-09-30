import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/core/exceptions/invalid_route_arg_exception.dart';
import 'package:hackathon/features/auth/data/auth_repository.dart';
import 'package:hackathon/features/auth/view/sign_in_page.dart';
import 'package:hackathon/features/compass/compass_screen.dart';
import 'package:hackathon/features/home/home_page.dart';
import 'package:hackathon/features/my_page/my_page.dart';
import 'package:hackathon/features/sample/sample_next_page.dart';
import 'package:hackathon/features/sample/sample_page.dart';
import 'package:hackathon/features/time_line/time_line_screen.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: CompassScreen.routeName,
    redirect: (context, state) async {
      // print(state);
      // return ref.read(authStateProvider).when(
      //       data: (data) {
      //         switch (data) {
      //           case null:
      //             return '/${SignInPage.routeName}';
      //           default:
      //             return null;
      //         }
      //       },
      //       error: (error, _) => '/${SignInPage.routeName}',
      //       loading: () => null,
      //     );
    },
    refreshListenable: ValueNotifier(ref.watch(authStateProvider)),
    routes: [
      GoRoute(
        path: HomePage.routeName,
        name: HomePage.routeName,
        builder: (_, __) => const HomePage(),
        routes: [
          GoRoute(
            path: SignInPage.routeName,
            name: SignInPage.routeName,
            builder: (_, __) => const SignInPage(),
          ),
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
          GoRoute(
            path: CompassScreen.routeName,
            name: CompassScreen.routeName,
            builder: (_, __) => const CompassScreen(),
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: Container(),
    ),
  );
});
