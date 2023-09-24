import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/core/exceptions/invalid_route_arg_exception.dart';
import 'package:hackathon/features/auth/view/log_in_page.dart';
import 'package:hackathon/features/auth/view/password_reset_page.dart';
import 'package:hackathon/features/auth/view/sign_in_page.dart';
import 'package:hackathon/features/home/home_page.dart';
import 'package:hackathon/features/my_page/my_page.dart';
import 'package:hackathon/features/sample/sample_next_page.dart';
import 'package:hackathon/features/sample/sample_page.dart';
import 'package:hackathon/features/time_line/time_line_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final routerProvider = Provider((ref) {
  final supabaseClient = supabase.Supabase.instance.client;

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: HomePage.routeName,
    // redirect: (context, state) {
    //   final session = supabaseClient.auth.currentSession;
    //
    //   if (session == null) {
    //     if (state.fullPath == '/${SignInPage.routeName}') {
    //       return '/${SignInPage.routeName}';
    //     } else if (state.fullPath == '/${PasswordResetPage.routeName}') {
    //       return '/${PasswordResetPage.routeName}';
    //     }
    //     return '/${LogInPage.routeName}';
    //   }
    //
    //   return null;
    // },
    // refreshListenable: ValueNotifier(supabaseClient.auth.onAuthStateChange),
    routes: [
      GoRoute(
        path: HomePage.routeName,
        name: HomePage.routeName,
        builder: (_, __) => const HomePage(),
        routes: [
          GoRoute(
            path: LogInPage.routeName,
            name: LogInPage.routeName,
            builder: (_, __) => const LogInPage(),
          ),
          GoRoute(
            path: SignInPage.routeName,
            name: SignInPage.routeName,
            builder: (_, __) => const SignInPage(),
          ),
          GoRoute(
            path: PasswordResetPage.routeName,
            name: PasswordResetPage.routeName,
            builder: (_, __) => const PasswordResetPage(),
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
        ],
      ),
    ],
    errorPageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: Container(),
    ),
  );
});
