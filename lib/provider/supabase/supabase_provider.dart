import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sup;

final supabaseProvider =
    Provider<sup.SupabaseClient>((ref) => sup.Supabase.instance.client);
