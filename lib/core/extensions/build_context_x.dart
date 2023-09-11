import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/core/route_argument.dart';

extension BuildContextX on BuildContext {
  void goNamedWithArg(
    String name, {
    required RouteArgument arg,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) =>
      GoRouter.of(this).goNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: arg,
      );
}
