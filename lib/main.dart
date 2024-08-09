import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:right_code_app/src/app/main_page/main_page.dart';
import 'package:right_code_app/supabase/supabase_api.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import './dep_injection.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: SupabaseAPIs.url, anonKey: SupabaseAPIs.anonKey);

  await dep.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().theme(isDark: false),
          locale: const Locale("en"),
          builder: OneContext().builder,
          navigatorKey: OneContext().key,
          home: const MainPage()),
    );
  }
}
