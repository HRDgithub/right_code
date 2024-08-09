import 'package:get_it/get_it.dart';
import 'package:right_code_app/src/app/refrigerator/data/refrigerator_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //* Riverpod

  ///* Change Notifer

  //* Auth UseCases

  //* Repositories
  getIt.registerLazySingleton<BaseRefrigeratorRepo>(
      () => RefrigeratorRepoImplement());

  //* Other
  final supabase = Supabase.instance;
  final sharedPreferences = await SharedPreferences.getInstance();

  ///
  getIt.registerLazySingleton(() => supabase);
  getIt.registerLazySingleton(() => sharedPreferences);
}
