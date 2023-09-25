import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/auth/data/google_auth_service.dart';

final authProvider = Provider(AuthRepository.new);

final authStateProvider =
    StreamProvider((ref) => ref.watch(authProvider).authStateChanged);

final class AuthRepository {
  const AuthRepository(this.ref);

  final Ref ref;

  static final _firebaseAuth = FirebaseAuth.instance;

  GoogleAuthService get _googleAuth => ref.watch(googleAuthServiceProvider);

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanged => _firebaseAuth.authStateChanges();

  Future<UserCredential> signInWithGoogle() async {
    final user = await _googleAuth.signIn();
    final authentication = await user?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: authentication?.accessToken,
      idToken: authentication?.idToken,
    );

    return _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> signOut() => _firebaseAuth.signOut();
}
