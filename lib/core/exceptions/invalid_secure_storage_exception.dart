class InvalidSecureStorageKeyException implements Exception {
  const InvalidSecureStorageKeyException({required this.key});

  final String key;

  String get message => '$this';

  @override
  String toString() {
    return '''!!!Invalid SecureStorage Key!!!
      key: $key
    ''';
  }
}