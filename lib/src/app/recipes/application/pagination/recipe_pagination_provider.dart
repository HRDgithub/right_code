import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:right_code_app/src/app/recipes/data/recipes_repository.dart';
import 'package:right_code_app/src/app/recipes/domain/recipe_model/recipe_model.dart';
import 'package:right_code_app/widgets/pagination/base_pagination_provier.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final recipesPaginationProvider = ChangeNotifierProvider.autoDispose((ref) {
  return RecipesPaginationProvider(limit: 10);
});

class RecipesPaginationProvider extends BasePaginationProvider<RecipeModel> {
  final BaseRecipesRepo baseRefrigeratorRepo = RecipesRepoImplement();

  ///
  ///
  ///
  RecipesPaginationProvider({required super.limit});

  TextEditingController searchText = TextEditingController();
  Future<void> updateSearchText(String value) async {
    searchText.text = value;
    if (value.isEmpty) {
      await resetAndLoadData();
    }
    notifyListeners();
  }

  String? categorySearch;
  Future<void> updateCategorySearchText(String? value) async {
    categorySearch = value;
    notifyListeners();
    await resetAndLoadData();
  }

  bool newFirst = true;
  Future<void> updateSortValue() async {
    newFirst = !newFirst;
    notifyListeners();
    await resetAndLoadData();
  }

  @override
  void listenToNewTableChanges() {
    realtime = supabase.client
        .channel("RecipesChannel")
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          table: "recipes",
          callback: (payload) async {
            await checkEventType(payload.eventType, payload);
          },
        )
        .subscribe();
  }

  @override
  Future<List<RecipeModel>> fetchItems(int from, int to) async {
    return await baseRefrigeratorRepo.getRecipesModels(
        from: from,
        to: to,
        limit: limit,
        searchText: searchText.text,
        categorySearch: categorySearch,
        newFirst: newFirst);
  }

  ///
  ///
  ///
  ///* Handle Events

  @override
  Future<void> handleDeleteEvent(Map<String, dynamic> payload) async {
    final id = payload['id'];
    items.removeWhere((fridge) => fridge.id == id);
  }

  @override
  Future<void> handleInsertEvent(Map<String, dynamic> payload) async {
    final model = RecipeModel.fromJson(payload);
    items.insert(0, model);
  }

  @override
  Future<void> handleUpdateEvent(Map<String, dynamic> payload) async {
    final model = RecipeModel.fromJson(payload);
    updateItem(model);
  }

  updateItem(RecipeModel newModel) {
    final existingMailIndex =
        items.indexWhere((fridge) => fridge.id == newModel.id);

    if (existingMailIndex != -1) {
      items[existingMailIndex] = newModel;
    }
  }
}
