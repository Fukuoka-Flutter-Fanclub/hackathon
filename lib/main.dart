import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/supabase_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: await const SupabaseConfig().supabaseURL(),
    anonKey: await const SupabaseConfig().supabaseAnonKey(),
  );
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
