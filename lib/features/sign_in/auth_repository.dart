import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/core/data/secure_storage_datasource.dart';
import 'package:hackathon/features/sign_in/google_auth_service.dart';
import 'package:hackathon/features/sign_in/supabase_auth_service.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(ref: ref));

class AuthRepository {
  const AuthRepository({required this.ref});

  final Ref ref;

  GoogleAuthService get googleAuth => ref.read(googleAuthServiceProvider);

  SupabaseAuthService get supabaseAuth => ref.read(supabaseAuthProvider);

  SecureStorageDatasource get secureStorage =>
      ref.read(secureStorageDatasourceProvider);

  Future<bool> signInByGoogle() async {
    return supabaseAuth.signInWithGoogle();
  }

  Future<void> signOut() async {
    await supabaseAuth.signOut();
  }
}
