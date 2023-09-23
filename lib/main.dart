import 'dart:async';
import 'package:dart_openai/dart_openai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/firebase_options.dart';
import 'package:hackathon/supabase_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await Supabase.initialize(
    url: SupabaseConfig.url,
    anonKey: SupabaseConfig.anonKey,
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  OpenAI.apiKey = dotenv.env['AI_APIKEY']!;

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
