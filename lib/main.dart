import 'dart:async';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  OpenAI.apiKey = dotenv.env['AI_APIKEY']!;

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
