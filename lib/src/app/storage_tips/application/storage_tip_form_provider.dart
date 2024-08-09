import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:right_code_app/src/app/storage_tips/domain/storage_tip/storage_tip_model.dart';

final storageTipsFormProvider = StateProvider.autoDispose
    .family<FormGroup, StorageTipModel?>((ref, editedModel) {
  return FormGroup({
    'name': FormControl<String>(
        value: editedModel?.name, validators: [Validators.required]),
    'category': FormControl<String>(
        value: editedModel?.category, validators: [Validators.required]),
    'details': FormControl<String>(
        value: editedModel?.details, validators: [Validators.required]),
  });
});
