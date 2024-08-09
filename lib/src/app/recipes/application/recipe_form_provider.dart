import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:right_code_app/src/app/recipes/domain/recipe_model/recipe_model.dart';

final recipeFormProvider = StateProvider.autoDispose
    .family<FormGroup, RecipeModel?>((ref, editedModel) {
  return FormGroup(
    {
      'name': FormControl<String>(
          value: editedModel?.name, validators: [Validators.required]),
      'ingredients': FormControl<List<String>>(
          value: editedModel?.ingredients ?? [],
          validators: [
            Validators.any(
              (value) => value != null,
            ),
            Validators.required
          ]),
      'category': FormControl<String>(
          value: editedModel?.category, validators: [Validators.required]),
      'details': FormControl<String>(
          value: editedModel?.details, validators: [Validators.required]),
    },
  );
});
