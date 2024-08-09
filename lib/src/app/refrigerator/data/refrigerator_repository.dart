import 'package:right_code_app/dep_injection.dart';
import 'package:right_code_app/src/app/refrigerator/domain/fridge_category/fridge_category_model.dart';
import 'package:right_code_app/utils/supabase_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../domain/fridge_model/fridge_model.dart';

abstract class BaseRefrigeratorRepo {
  Stream<List<FridgeCategoryModel>> getFridgeCategory();
  Future<List<FridgeModel>> getFridgeModels({
    required int from,
    required int to,
    required int limit,
    required String searchText,
    required String? categorySearch,
    required bool newFirst,
  });

  Future<String?> addNewFridgeCategory({required String categoryName});

  Future<FridgeModel?> addNewItemToFridge({required FridgeModel fridgeModel});

  Future<FridgeModel?> removeItem({required int itemiId});
  Future<FridgeModel?> editItem({required FridgeModel editedModel});
}

class RefrigeratorRepoImplement extends BaseRefrigeratorRepo {
  final Supabase supabase = getIt<Supabase>();

  @override
  Future<List<FridgeModel>> getFridgeModels({
    required int from,
    required int to,
    required int limit,
    required String searchText,
    required String? categorySearch,
    required bool newFirst,
  }) async {
    try {
      var doc = supabase.client.from("refrigerator").select("*");

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
          return event.map((e) => FridgeModel.fromJson(e)).toList();
        }
        return [];
      });
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }

  @override
  Stream<List<FridgeCategoryModel>> getFridgeCategory() {
    try {
      final doc = supabase.client.from("categories");
      return doc.stream(primaryKey: ['id']).eq("type", "fridge").map((event) {
            if (event.isNotEmpty) {
              return event.map((e) => FridgeCategoryModel.fromJson(e)).toList();
            }
            return [];
          });
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }

  @override
  Future<String?> addNewFridgeCategory({required String categoryName}) async {
    try {
      final doc = supabase.client.from("categories");
      return await doc
          .insert({"name": categoryName.trim().toString(), "type": "fridge"})
          .select('name')
          .maybeSingle()
          .then((value) => value?['name']);
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }

  @override
  Future<FridgeModel?> addNewItemToFridge(
      {required FridgeModel fridgeModel}) async {
    try {
      final doc = supabase.client.from("refrigerator");
      return await doc
          .insert(fridgeModel.toJson())
          .select('*')
          .maybeSingle()
          .then((value) {
        if (value != null) {
          return FridgeModel.fromJson(value);
        }
        return null;
      });
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }

  @override
  Future<FridgeModel?> editItem({required FridgeModel editedModel}) async {
    try {
      final doc = supabase.client
          .from("refrigerator")
          .update(editedModel.toJson())
          .eq("id", editedModel.id)
          .select('*')
          .maybeSingle();

      return await doc.then((event) {
        if (event != null) {
          return FridgeModel.fromJson(event);
        }
        return null;
      });
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }

  @override
  Future<FridgeModel?> removeItem({required int itemiId}) async {
    try {
      final data = await supabase.client
          .from("refrigerator")
          .delete()
          .eq("id", itemiId)
          .select('*')
          .maybeSingle();

      if (data != null) {
        return FridgeModel.fromJson(data);
      }
      return null;
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }
}
