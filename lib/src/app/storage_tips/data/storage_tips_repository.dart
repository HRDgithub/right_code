import 'package:right_code_app/dep_injection.dart';
import 'package:right_code_app/src/app/storage_tips/domain/storage_tip/storage_tip_model.dart';
import 'package:right_code_app/utils/supabase_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseStorageTipsRepo {
  Future<List<StorageTipModel>> getStorageTips({
    required int from,
    required int to,
    required int limit,
    required String searchText,
    required String? categorySearch,
    required bool newFirst,
  });

  Future<StorageTipModel?> addNewItemToStorageTips(
      {required StorageTipModel storageModel});

  Future<StorageTipModel?> removeItem({required int itemiId});
  Future<StorageTipModel?> editItem({required StorageTipModel editedModel});
}

class StorageTipsRepoImplement extends BaseStorageTipsRepo {
  final Supabase supabase = getIt<Supabase>();

  @override
  Future<List<StorageTipModel>> getStorageTips({
    required int from,
    required int to,
    required int limit,
    required String searchText,
    required String? categorySearch,
    required bool newFirst,
  }) async {
    try {
      var doc = supabase.client.from("storage_tips").select("*");

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
          return event.map((e) => StorageTipModel.fromJson(e)).toList();
        }
        return [];
      });
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }

  @override
  Future<StorageTipModel?> addNewItemToStorageTips(
      {required StorageTipModel storageModel}) async {
    try {
      final doc = supabase.client.from("storage_tips");
      return await doc
          .insert(storageModel.toJson())
          .select('*')
          .maybeSingle()
          .then((value) {
        if (value != null) {
          return StorageTipModel.fromJson(value);
        }
        return null;
      });
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }

  @override
  Future<StorageTipModel?> editItem(
      {required StorageTipModel editedModel}) async {
    try {
      final doc = supabase.client
          .from("storage_tips")
          .update(editedModel.toJson())
          .eq("id", editedModel.id)
          .select('*')
          .maybeSingle();

      return await doc.then((event) {
        if (event != null) {
          return StorageTipModel.fromJson(event);
        }
        return null;
      });
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }

  @override
  Future<StorageTipModel?> removeItem({required int itemiId}) async {
    try {
      final data = await supabase.client
          .from("storage_tips")
          .delete()
          .eq("id", itemiId)
          .select('*')
          .maybeSingle();

      if (data != null) {
        return StorageTipModel.fromJson(data);
      }
      return null;
    } on PostgrestException catch (e) {
      throw handleSupabaseException(e);
    }
  }
}
