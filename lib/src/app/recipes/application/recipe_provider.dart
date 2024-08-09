import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:right_code_app/src/app/recipes/data/recipes_repository.dart';
import 'package:right_code_app/src/app/recipes/domain/recipe_category_model/recipe_category_model.dart';

//* Providers
final recipesRepositoryProvider = Provider<BaseRecipesRepo>((ref) {
  return RecipesRepoImplement();
});

final getRecipesCategoryStreamProvider =
    StreamProvider.autoDispose<List<RecipeCategoryModel>>((ref) {
  final data = ref.watch(recipesRepositoryProvider).getRecipesCategory();
  return data;
});
