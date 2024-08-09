import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:right_code_app/src/app/refrigerator/data/refrigerator_repository.dart';
import 'package:right_code_app/src/app/refrigerator/domain/fridge_category/fridge_category_model.dart';

//* Providers
final myRefrigeratorRepositoryProvider = Provider<BaseRefrigeratorRepo>((ref) {
  return RefrigeratorRepoImplement();
});

final getFridgeCategoryStreamProvider =
    StreamProvider.autoDispose<List<FridgeCategoryModel>>((ref) {
  final data = ref.watch(myRefrigeratorRepositoryProvider).getFridgeCategory();
  return data;
});
