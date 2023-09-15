import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hackathon/core/exceptions/invalid_secure_storage_exception.dart';

final secureStorageDatasourceProvider = Provider(
  (_) => const SecureStorageDatasource(),
);

class SecureStorageDatasource {
  const SecureStorageDatasource();

  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    return _storage.read(key: key);
  }

  Future<void> delete({required String key}) async {
    final keyCanDelete = await _storage.containsKey(key: key);
    if (keyCanDelete) {
      throw InvalidSecureStorageKeyException(key: key);
    }
    await _storage.delete(key: key);
  }
}
