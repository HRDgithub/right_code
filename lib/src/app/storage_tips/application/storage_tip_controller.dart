// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:right_code_app/src/app/storage_tips/data/storage_tips_repository.dart';
import 'package:right_code_app/src/app/storage_tips/domain/storage_tip/storage_tip_model.dart';
import 'package:right_code_app/utils/loading_state_class.dart';
import 'package:right_code_app/utils/supabase_exceptions.dart';
import 'package:right_code_app/widgets/show_dialog.dart';

//* Add Item To Fridge
final storageTipsItemController = StateNotifierProvider.autoDispose
    .family<StorageTipsItemController, LoadingStateClass<StorageTipModel>, int>(
        (ref, id) {
  return StorageTipsItemController();
});

class StorageTipsItemController
    extends StateNotifier<LoadingStateClass<StorageTipModel>> {
  StorageTipsItemController() : super(LoadingStateClass.initialData());
  final BaseStorageTipsRepo baseRepo = StorageTipsRepoImplement();

  void updateState({
    AsyncValue<StorageTipModel?>? edit,
    AsyncValue<StorageTipModel?>? add,
    AsyncValue<StorageTipModel?>? delete,
  }) {
    state = state.copyWith(
      edit: edit,
      add: add,
      delete: delete,
    );
  }

  Future<StorageTipModel?> addOrUpdateItem(
      {required FormGroup form,
      StorageTipModel? editedModel,
      required bool isUpdate}) async {
    ///
    ///
    final model = StorageTipModel(
      id: editedModel?.id ?? 0, //Ignore
      name: form.value['name'] as String,
      category: form.value['category'] as String,
      details: form.value['details'] as String,
    );

    final storageModel =
        isUpdate ? await editItem(model) : await addItem(model);

    return storageModel;
  }

  Future<StorageTipModel?> addItem(
    StorageTipModel model,
  ) async {
    updateState(add: const AsyncLoading());
    try {
      final data = await baseRepo.addNewItemToStorageTips(storageModel: model);
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

  Future<StorageTipModel?> editItem(StorageTipModel model) async {
    updateState(edit: const AsyncLoading());
    try {
      final data = await baseRepo.editItem(editedModel: model);
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

  Future<StorageTipModel?> removeItem(int id) async {
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
