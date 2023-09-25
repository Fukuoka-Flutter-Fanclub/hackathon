import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/core/exceptions/invalid_route_arg_exception.dart';
import 'package:hackathon/features/auth/data/auth_repository.dart';
import 'package:hackathon/features/auth/view/password_reset_page.dart';
import 'package:hackathon/features/auth/view/sign_in_page.dart';
import 'package:hackathon/features/home/home_page.dart';
import 'package:hackathon/features/init/initial_page.dart';
import 'package:hackathon/features/my_page/my_page.dart';
import 'package:hackathon/features/sample/sample_next_page.dart';
import 'package:hackathon/features/sample/sample_page.dart';
import 'package:hackathon/features/time_line/time_line_screen.dart';
import 'package:hackathon/features/webRTC/channel_setting_page.dart';
import 'package:hackathon/features/webRTC/video_page.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: InitialPage.routeName,
    redirect: (context, state) async {
      return ref.read(authStateProvider).when(
            data: (data) {
              switch (data) {
                case null:
                  return '/${SignInPage.routeName}';
                default:
                  return '/${HomePage.routeName}';
              }
            },
            error: (error, _) => '/${SignInPage.routeName}',
            loading: () => null,
          );
    },
    refreshListenable: ValueNotifier(ref.watch(authStateProvider)),
    routes: [
      GoRoute(
        path: InitialPage.routeName,
        name: InitialPage.routeName,
        builder: (_, __) => const InitialPage(),
        routes: [
          GoRoute(
            path: HomePage.routeName,
            name: HomePage.routeName,
            builder: (_, __) => const HomePage(),
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
          GoRoute(
            path: ChannelSttingPage.routeName,
            name: ChannelSttingPage.routeName,
            builder: (_, __) => const ChannelSttingPage(),
            routes: [
              GoRoute(
                path: '${VideoPage.routeName}:channelName',
                name: VideoPage.routeName,
                builder: (_, state) => VideoPage(
                  channelName: state.pathParameters['channelName'] ?? '',
                ),
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
  );
});
