// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:right_code_app/src/app/main_page/widgets/custom_return_app_bar.dart';
import 'package:right_code_app/src/app/recipes/application/recipe_controller.dart';
import 'package:right_code_app/src/app/recipes/application/recipe_form_provider.dart';
import 'package:right_code_app/src/app/recipes/application/recipe_provider.dart';
import 'package:right_code_app/src/app/recipes/domain/recipe_category_model/recipe_category_model.dart';
import 'package:right_code_app/src/app/recipes/domain/recipe_model/recipe_model.dart';
import 'package:right_code_app/src/app/recipes/presentation/widgets/chip_text_field_widget.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/utils/context_extantions.dart';
import 'package:right_code_app/widgets/box_button.dart';
import 'package:right_code_app/widgets/cotegory_name_picker_dialog.dart';
import 'package:right_code_app/widgets/custom_category_widget_view.dart';
import 'package:right_code_app/widgets/image_widgets.dart';
import 'package:right_code_app/widgets/show_dialog.dart';
import 'package:right_code_app/widgets/text_widget.dart';

class AddEditItemRecipesPage extends HookWidget {
  const AddEditItemRecipesPage({
    super.key,
    this.editedModel,
  });
  final RecipeModel? editedModel;

  @override
  Widget build(BuildContext context) {
    //* UseStates
    final selectCategoryUseState = useState<String?>(editedModel?.category);
    final selectImageUseState = useState<Uint8List?>(null);

    //* Values
    final selectImageValue = selectImageUseState.value;
    final selectedCategoryValue = selectCategoryUseState.value;

    //* Others
    final imageUrl = editedModel?.imgUrl;
    bool isUpdateState = editedModel != null;
    bool isImageSelected = imageUrl != null ? true : selectImageValue != null;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width, 80),
        child: const CustomReturnBackAppBar(),
      ),
      body: Consumer(builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ReactiveFormBuilder(
            form: () {
              return ref.watch(recipeFormProvider(editedModel));
            },
            builder: (context, form, child) {
              return ListView(
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        "Add New Recipe",
                        fontWeight: FontWeight.bold,
                        textColor: AppTheme.primary,
                        fontSize: 35,
                      ),
                      TextWidget(
                        "Add item to your Recipes",
                        textOpacity: 0.8,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  ///* Categiory
                  Consumer(
                    builder: (context, ref, child) {
                      return SizedBox(
                        height: 65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: CustomCategoryStreamWidget<
                                    RecipeCategoryModel>(
                              dataProvider: getRecipesCategoryStreamProvider,
                              isSelected: (item) {
                                return item.name == selectedCategoryValue;
                              },
                              onPressed: (item) {
                                selectCategoryUseState.value = item.name;
                                form.control("category").updateValue(item.name);
                              },
                              title: (item) {
                                return item.name;
                              },
                            )),
                            BoxButton(
                              loading:
                                  ref.watch(recipeCategoryController).isLoading,
                              margin: const EdgeInsets.only(left: 10),
                              raduis: AppTheme.raduisCirlce,
                              onPressed: () async {
                                await categoryNamePickerDialog(
                                  hintText: "Pizza",
                                  onPressed: (name) async {
                                    await ref
                                        .read(recipeCategoryController.notifier)
                                        .addItem(name);
                                  },
                                );
                              },
                              bgColorOpacity: 1,
                              bgColor: AppTheme.primary,
                              icon: FontAwesome.plus_solid,
                              iconColor: AppTheme.whiteText,
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  ///* Image Picker
                  Center(
                    child: BoxButton(
                      width: 300,
                      height: 300,
                      raduis: AppTheme.raduisCirlce,
                      bgColor: AppTheme.primary,
                      bgColorOpacity: 1,
                      child: ClipRRect(
                        borderRadius: AppTheme.raduisCirlce,
                        child: selectImageValue != null
                            ? CustomImageMemory(
                                dimension: 300, data: selectImageValue)
                            : imageUrl != null
                                ? CustomImageNetwork(
                                    dimension: 300, url: imageUrl)
                                : const Center(
                                    child: Icon(
                                      Iconsax.image_outline,
                                      color: AppTheme.whiteText,
                                      size: 50,
                                    ),
                                  ),
                      ),
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            withData: true,
                            type: FileType.image);

                        if (result != null && result.files.isNotEmpty) {
                          selectImageUseState.value = result.files.first.bytes;
                        }
                      },
                    ),
                  ),

                  ///
                  const SizedBox(height: 15),
                  ReactiveTextField(
                    formControlName: 'name',
                    style: textTheme.bodyMedium,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 10),

                  ChipTextFieldWidget(
                    labelText: 'Ingredients',
                    defaultChips: form.value['ingredients'] as List<String>,
                    onChipListChanged: (value) {
                      form.control("ingredients").updateValue(value);
                    },
                  ),
                  const SizedBox(height: 10),

                  ReactiveTextField(
                    formControlName: 'details',
                    style: textTheme.bodyMedium,
                    decoration: const InputDecoration(
                      labelText: 'Details',
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 20),
                  Consumer(builder: (context, ref, child) {
                    final state =
                        ref.watch(recipeItemController(editedModel?.id ?? 0));
                    final provider = ref.read(
                        recipeItemController(editedModel?.id ?? 0).notifier);
                    return BoxButton(
                      loading: state.add.isLoading || state.edit.isLoading,
                      onPressed: () async {
                        final ingredientIsValid =
                            form.control('ingredients').valid;

                        if (form.valid &&
                            selectedCategoryValue != null &&
                            ingredientIsValid &&
                            isImageSelected) {
                          await provider
                              .addOrUpdateItem(
                            form: form,
                            editedModel: editedModel,
                            imageData: selectImageValue,
                            isUpdate: isUpdateState,
                          )
                              .then(
                            (value) async {
                              if (value != null) {
                                Navigator.pop(context);
                                await showWarningDialog(
                                    header: "Success",
                                    title: isUpdateState
                                        ? "Item updated successfuly"
                                        : "Added item to Recipes successfuly",
                                    status: AlertDialogStatus.success);
                              }
                            },
                          );
                        } else {
                          form.markAllAsTouched();
                        }

                        if (selectedCategoryValue == null) {
                          await showWarningDialog(
                            header: "No Catgeory Selected",
                            title: "Please select a category for your item",
                            status: AlertDialogStatus.warning,
                          );
                        }
                        if (!isImageSelected) {
                          await showWarningDialog(
                            header: "No Image Selected",
                            title: "Please add an Image",
                            status: AlertDialogStatus.warning,
                          );
                        }
                        if (!ingredientIsValid) {
                          await showWarningDialog(
                            header: "No Ingredient",
                            title: "Please add at least one Ingredient",
                            status: AlertDialogStatus.warning,
                          );
                        }
                      },
                      bgColor: AppTheme.buttonColor,
                      bgColorOpacity: 1,
                      child: const TextWidget(
                        'Proceed',
                        textColor: AppTheme.whiteText,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
