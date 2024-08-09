import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:right_code_app/src/app/refrigerator/domain/fridge_model/fridge_model.dart';

final fridgeFormProvider = StateProvider.autoDispose
    .family<FormGroup, FridgeModel?>((ref, editedModel) {
  return FormGroup({
    'name': FormControl<String>(
        value: editedModel?.name, validators: [Validators.required]),
    'purchaseDate': FormControl<DateTime>(
        value: editedModel?.purchaseDate ?? DateTime.now(),
        validators: [Validators.required]),
    'expirationDate': FormControl<DateTime>(
        value: editedModel?.expireDate ??
            DateTime.now().add(const Duration(days: 7)),
        validators: [Validators.required]),
    'quantity': FormControl<int>(
        value: editedModel?.quantity, validators: [Validators.number()]),
    'unit': FormControl<String>(
        value: editedModel?.unit, validators: [Validators.required]),
    'marketName': FormControl<String>(
        value: editedModel?.marketName, validators: [Validators.required]),
    'notes': FormControl<String>(value: editedModel?.notes),
    'category': FormControl<String>(
        value: editedModel?.category, validators: [Validators.required]),
  });
});
