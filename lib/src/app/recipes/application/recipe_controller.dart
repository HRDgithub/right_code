// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:right_code_app/src/app/recipes/data/recipes_repository.dart';
import 'package:right_code_app/src/app/recipes/domain/recipe_model/recipe_model.dart';
import 'package:right_code_app/supabase/supabase_storage_api.dart';
import 'package:right_code_app/utils/loading_state_class.dart';
import 'package:right_code_app/utils/supabase_exceptions.dart';
import 'package:right_code_app/widgets/show_dialog.dart';
import 'package:uuid/uuid.dart';

//* Add Item To Recipe Category
final recipeCategoryController = StateNotifierProvider.autoDispose<
    RecipeCategoryController, AsyncValue<String?>>((ref) {
  return RecipeCategoryController();
});

class RecipeCategoryController extends StateNotifier<AsyncValue<String?>> {
  RecipeCategoryController() : super(const AsyncData(null));
  final BaseRecipesRepo baseRepo = RecipesRepoImplement();

  Future<void> addItem(String name) async {
    state = const AsyncLoading();
    try {
      final data = await baseRepo.addNewRecipeCategory(categoryName: name);
      if (data != null) {
        state = AsyncValue.data(data);
      }
    } on SupabaseException catch (e, s) {
      state = AsyncError(e, s);
      await showWarningDialog(
          header: "Error", title: e.message, status: AlertDialogStatus.error);
    }
  }
}

//* Add Item To Fridge
final recipeItemController = StateNotifierProvider.autoDispose
    .family<RecipeItemController, LoadingStateClass<RecipeModel>, int>(
        (ref, id) {
  return RecipeItemController();
});

class RecipeItemController
    extends StateNotifier<LoadingStateClass<RecipeModel>> {
  RecipeItemController() : super(LoadingStateClass.initialData());
  final BaseRecipesRepo baseRepo = RecipesRepoImplement();

  void updateState({
    AsyncValue<RecipeModel?>? edit,
    AsyncValue<RecipeModel?>? add,
    AsyncValue<RecipeModel?>? delete,
  }) {
    state = state.copyWith(
      edit: edit,
      add: add,
      delete: delete,
    );
  }

  Future<RecipeModel?> addOrUpdateItem(
      {required FormGroup form,
      RecipeModel? editedModel,
      Uint8List? imageData,
      required bool isUpdate}) async {
    ///
    ///
    final model = RecipeModel(
      id: editedModel?.id ?? 0, //Ignore
      createdAt: DateTime.now(), // Ignore
      name: form.value['name'] as String,
      category: form.value['category'] as String,
      imgUrl: editedModel?.imgUrl ?? '',
      ingredients: form.value['ingredients'] as List<String>,
      details: form.value['details'] as String?,
    );

    final fridgeModel = isUpdate
        ? await editItem(model, imageData)
        : await addItem(model, imageData);

    return fridgeModel;
  }

  Future<RecipeModel?> addItem(
    RecipeModel model,
    Uint8List? imageData,
  ) async {
    updateState(add: const AsyncLoading());
    try {
      String? imageURL;
      if (imageData != null) {
        imageURL = await SupabaseStorageImplement().uploadOneFile(
            bucketName: "IMG",
            fileData: imageData,
            fileName: "${const Uuid().v1()}/img.png");
      }
      final data = await baseRepo.addNewItemToRecipes(
          recipeModel: model.copyWith(imgUrl: imageURL ?? model.imgUrl));
      if (data != null) {
        updateState(add: AsyncValue.data(data));
        return data;
      }
    } on SupabaseException catch (e, s) {
      updateState(add: AsyncError(e, s));
      await showWarningDialog(
          header: "Error", title: e.message, status: AlertDialogStatus.error);
    }
    return null;
  }

  Future<RecipeModel?> editItem(RecipeModel model, Uint8List? imageData) async {
    updateState(edit: const AsyncLoading());
    try {
      String? imageURL;
      if (imageData != null) {
        await SupabaseStorageImplement().removeFile(path: model.imgUrl);
        imageURL = await SupabaseStorageImplement().uploadOneFile(
            bucketName: "IMG",
            fileData: imageData,
            fileName: "${const Uuid().v1()}/img.png");
      }
      final data = await baseRepo.editItem(
          editedModel: model.copyWith(imgUrl: imageURL ?? model.imgUrl));
      if (data != null) {
        updateState(edit: AsyncValue.data(data));
        return data;
      }
    } on SupabaseException catch (e, s) {
      updateState(edit: AsyncError(e, s));
      await showWarningDialog(
          header: "Error", title: e.message, status: AlertDialogStatus.error);
    }
    return null;
  }

  Future<RecipeModel?> removeItem(int id) async {
    updateState(delete: const AsyncLoading());
    try {
      final data = await baseRepo.removeItem(itemiId: id);
      if (data != null) {
        updateState(delete: AsyncValue.data(data));
        return data;
      }
    } on SupabaseException catch (e, s) {
      updateState(delete: AsyncError(e, s));
      await showWarningDialog(
          header: "Error", title: e.message, status: AlertDialogStatus.error);
    }
    return null;
  }
}
