// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hackathon/provider/supabase/supabase_auth_provider.dart';
// import 'package:supabase_flutter/supabase_flutter.dart' as sup;

// final loginPageController = Provider((ref) => LoginPageController(ref));

// class LoginPageController {
//   LoginPageController(this._ref);

//   final Ref _ref;

//   SupabaseAuthRepository get _supabaseAuth => _ref.read(supabaseAuthProvider);

//   bool isEmailValid(String email) => email.isNotEmpty || email.contains('@');

//   bool isPasswordValid(String password) => password.length >= 8;

//   Future<String> submit({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       await _supabaseAuth.emailSignin(
//         email: email,
//         password: password,
//       );
//       return '200';
//     } on sup.AuthException catch (e) {
//       return e.statusCode ?? '500';
//     }
//   }
// }
