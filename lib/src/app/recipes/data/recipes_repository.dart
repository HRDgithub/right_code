import 'package:right_code_app/dep_injection.dart';
import 'package:right_code_app/src/app/recipes/domain/recipe_category_model/recipe_category_model.dart';
import 'package:right_code_app/src/app/recipes/domain/recipe_model/recipe_model.dart';
import 'package:right_code_app/utils/supabase_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseRecipesRepo {
  Stream<List<RecipeCategoryModel>> getRecipesCategory();
  Future<List<RecipeModel>> getRecipesModels({
    required int from,
    required int to,
    required int limit,
    required String searchText,
    required String? categorySearch,
    required bool newFirst,
  });

  Future<String?> addNewRecipeCategory({required String categoryName});

  Future<RecipeModel?> addNewItemToRecipes({required RecipeModel recipeModel});

  Future<RecipeModel?> removeItem({required int itemiId});
  Future<RecipeModel?> editItem({required RecipeModel editedModel});
}

class RecipesRepoImplement extends BaseRecipesRepo {
  final Supabase supabase = getIt<Supabase>();

  @override
  Future<List<RecipeModel>> getRecipesModels({
    required int from,
    required int to,
    required int limit,
    required String searchText,
    required String? categorySearch,
    required bool newFirst,
  }) async {
    try {
      var doc = supabase.client.from("recipes").select("*");

      //* Filters
      if (searchText.isNotEmpty) {
        doc = doc.ilike("name", "%${searchText.trim()}%");
      }

      if (categorySearch != null) {
        doc = doc.eq("category", categorySearch);
      }

      ///
      return await doc
          .order('created_at', ascending: !newFirst)
          .limit(limit)
          .range(from, to)
          .then((event) {
        if (event.isNotEmpty) {
          return event.map((e) => RecipeModel.fromJson(e)).toList();
        }
        return [];
      });
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }

  @override
  Stream<List<RecipeCategoryModel>> getRecipesCategory() {
    try {
      final doc = supabase.client.from("categories");
      return doc.stream(primaryKey: ['id']).eq("type", "recipe").map((event) {
            if (event.isNotEmpty) {
              return event.map((e) => RecipeCategoryModel.fromJson(e)).toList();
            }
            return [];
          });
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }

  @override
  Future<String?> addNewRecipeCategory({required String categoryName}) async {
    try {
      final doc = supabase.client.from("categories");
      return await doc
          .insert({"name": categoryName.trim().toString(), "type": "recipe"})
          .select('name')
          .maybeSingle()
          .then((value) => value?['name']);
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }

  @override
  Future<RecipeModel?> addNewItemToRecipes(
      {required RecipeModel recipeModel}) async {
    try {
      final doc = supabase.client.from("recipes");
      return await doc
          .insert(recipeModel.toJson())
          .select('*')
          .maybeSingle()
          .then((value) {
        if (value != null) {
          return RecipeModel.fromJson(value);
        }
        return null;
      });
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }

  @override
  Future<RecipeModel?> editItem({required RecipeModel editedModel}) async {
    try {
      final doc = supabase.client
          .from("recipes")
          .update(editedModel.toJson())
          .eq("id", editedModel.id)
          .select('*')
          .maybeSingle();

      return await doc.then((event) {
        if (event != null) {
          return RecipeModel.fromJson(event);
        }
        return null;
      });
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }

  @override
  Future<RecipeModel?> removeItem({required int itemiId}) async {
    try {
      final data = await supabase.client
          .from("recipes")
          .delete()
          .eq("id", itemiId)
          .select('*')
          .maybeSingle();

      if (data != null) {
        return RecipeModel.fromJson(data);
      }
      return null;
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }
}
