import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/core/exceptions/invalid_route_arg_exception.dart';
import 'package:hackathon/features/home/home_page.dart';
import 'package:hackathon/features/my_page/my_page.dart';
import 'package:hackathon/features/root/root_page.dart';
import 'package:hackathon/features/sample/sample_next_page.dart';
import 'package:hackathon/features/sample/sample_page.dart';
import 'package:hackathon/features/sign_in/auth_repository.dart';
import 'package:hackathon/features/sign_in/sign_in_page.dart';
import 'package:hackathon/features/sign_in/supabase_auth_service.dart';

const authPath = '/auth';

final routerProvider = Provider(
  (ref) => GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RootPage.routeName,
    redirect: (context, state) {
      return null;
    },
    refreshListenable: ValueNotifier(ref.watch(authChangedProvider)),
    routes: [
      GoRoute(
        path: RootPage.routeName,
        name: RootPage.routeName,
        builder: (_, __) => const RootPage(),
        routes: [
          GoRoute(
            path: SignInPage.routeName,
            name: SignInPage.routeName,
            builder: (_, __) => const SignInPage(),
          ),
          GoRoute(
            path: HomePage.routeName,
            name: HomePage.routeName,
            builder: (_, __) => const HomePage(),
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
        ],
      ),
    ],
    errorPageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: Container(),
    ),
  ),
);
