class InvalidRouteArgException implements Exception {
  const InvalidRouteArgException({
    required this.routeName,
    required this.arg,
  });

  final String routeName;
  final Object? arg;

  String get message => '$this';

  @override
  String toString() {
    return '''!!!Invalid Route Argment!!!
      routeName: $routeName,
      argument: $arg
    ''';
  }
}
