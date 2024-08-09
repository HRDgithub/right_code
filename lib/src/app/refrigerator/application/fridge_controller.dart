// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:right_code_app/src/app/refrigerator/data/refrigerator_repository.dart';
import 'package:right_code_app/src/app/refrigerator/domain/fridge_model/fridge_model.dart';
import 'package:right_code_app/supabase/supabase_storage_api.dart';
import 'package:right_code_app/utils/loading_state_class.dart';
import 'package:right_code_app/utils/supabase_exceptions.dart';
import 'package:right_code_app/widgets/show_dialog.dart';
import 'package:uuid/uuid.dart';

//* Add Item To Fridge Category
final fridgeCategoryController = StateNotifierProvider.autoDispose<
    FridgeCategoryController, AsyncValue<String?>>((ref) {
  return FridgeCategoryController();
});

class FridgeCategoryController extends StateNotifier<AsyncValue<String?>> {
  FridgeCategoryController() : super(const AsyncData(null));
  final BaseRefrigeratorRepo baseRepo = RefrigeratorRepoImplement();

  Future<void> addItem(String name) async {
    state = const AsyncLoading();
    try {
      final data = await baseRepo.addNewFridgeCategory(categoryName: name);
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
final fridgeItemController = StateNotifierProvider.autoDispose
    .family<FridgeItemController, LoadingStateClass<FridgeModel>, int>(
        (ref, id) {
  return FridgeItemController();
});

class FridgeItemController
    extends StateNotifier<LoadingStateClass<FridgeModel>> {
  FridgeItemController() : super(LoadingStateClass.initialData());
  final BaseRefrigeratorRepo baseRepo = RefrigeratorRepoImplement();

  void updateState({
    AsyncValue<FridgeModel?>? edit,
    AsyncValue<FridgeModel?>? add,
    AsyncValue<FridgeModel?>? delete,
  }) {
    state = state.copyWith(
      edit: edit,
      add: add,
      delete: delete,
    );
  }

  Future<FridgeModel?> addOrUpdateItem(
      {required FormGroup form,
      FridgeModel? editedModel,
      Uint8List? imageData,
      required bool isUpdate}) async {
    ///
    ///
    final model = FridgeModel(
        id: editedModel?.id ?? 0, //Ignore
        createdAt: DateTime.now(), // Ignore
        name: form.value['name'] as String,
        category: form.value['category'] as String,
        imgUrl: editedModel?.imgUrl ?? '',
        purchaseDate: form.value['purchaseDate'] as DateTime,
        expireDate: form.value['expirationDate'] as DateTime,
        quantity: int.parse(form.value['quantity'].toString()),
        unit: form.value['unit'] as String,
        marketName: form.value['marketName'] as String,
        notes: form.value['notes'] as String?);

    final fridgeModel = isUpdate
        ? await editItem(model, imageData)
        : await addItem(model, imageData);

    return fridgeModel;
  }

  Future<FridgeModel?> addItem(
    FridgeModel model,
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
      final data = await baseRepo.addNewItemToFridge(
          fridgeModel: model.copyWith(imgUrl: imageURL ?? model.imgUrl));
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

  Future<FridgeModel?> editItem(FridgeModel model, Uint8List? imageData) async {
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

  Future<FridgeModel?> removeItem(int id) async {
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
