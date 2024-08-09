// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:right_code_app/src/app/main_page/widgets/custom_return_app_bar.dart';
import 'package:right_code_app/src/app/refrigerator/application/fridge_controller.dart';
import 'package:right_code_app/src/app/refrigerator/application/fridge_form_provider.dart';
import 'package:right_code_app/src/app/refrigerator/domain/fridge_model/fridge_model.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/utils/context_extantions.dart';
import 'package:right_code_app/widgets/box_button.dart';
import 'package:right_code_app/widgets/fridge_category_widget/fridge_add_new_catgeory_widget.dart';
import 'package:right_code_app/widgets/image_widgets.dart';
import 'package:right_code_app/widgets/rounded_date_picker.dart';
import 'package:right_code_app/widgets/show_dialog.dart';
import 'package:right_code_app/widgets/text_widget.dart';

class AddEditItemRefrigeratorPage extends HookWidget {
  const AddEditItemRefrigeratorPage({
    super.key,
    this.editedModel,
  });
  final FridgeModel? editedModel;

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
    final isUpdateState = editedModel != null;
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
              return ref.watch(fridgeFormProvider(editedModel));
            },
            builder: (context, form, child) {
              return ListView(
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        "Add New Item",
                        fontWeight: FontWeight.bold,
                        textColor: AppTheme.primary,
                        fontSize: 35,
                      ),
                      TextWidget(
                        "Add item to your Refrigerator",
                        textOpacity: 0.8,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  ///* Category
                  FridgeAddNewCatgeoryWidget(
                    isSelected: (item) {
                      return item.name == selectedCategoryValue;
                    },
                    onPressed: (item) {
                      selectCategoryUseState.value = item.name;
                      form.control("category").updateValue(item.name);
                    },
                  ),

                  ///
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoxButton(
                        width: 50,
                        height: 50,
                        raduis: AppTheme.raduisCirlce,
                        bgColor: AppTheme.primary,
                        bgColorOpacity: 1,
                        child: ClipRRect(
                          borderRadius: AppTheme.raduisCirlce,
                          child: selectImageValue != null
                              ? CustomImageMemory(
                                  dimension: 50, data: selectImageValue)
                              : imageUrl != null
                                  ? CustomImageNetwork(
                                      dimension: 50, url: imageUrl)
                                  : const Center(
                                      child: Icon(
                                        Iconsax.image_outline,
                                        color: AppTheme.whiteText,
                                      ),
                                    ),
                        ),
                        onPressed: () async {
                          final result = await FilePicker.platform.pickFiles(
                              allowMultiple: false,
                              withData: true,
                              type: FileType.image);

                          if (result != null && result.files.isNotEmpty) {
                            selectImageUseState.value =
                                result.files.first.bytes;
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'name',
                          style: textTheme.bodyMedium,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ReactiveTextField(
                          onTap: (control) async {
                            final date = await pickDate(context);
                            if (date != null) {
                              control.value = date;
                            }
                          },
                          formControlName: 'purchaseDate',
                          style: textTheme.bodyMedium,
                          decoration: const InputDecoration(
                            labelText: 'Purchase Date',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ReactiveTextField(
                          onTap: (control) async {
                            final date = await pickDate(context);
                            if (date != null) {
                              control.value = date;
                            }
                          },
                          formControlName: 'expirationDate',
                          style: textTheme.bodyMedium,
                          decoration: const InputDecoration(
                            labelText: 'Expiration Date',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'quantity',
                          style: textTheme.bodyMedium,
                          decoration: const InputDecoration(
                            labelText: 'Quantity',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'unit',
                          style: textTheme.bodyMedium,
                          decoration: const InputDecoration(
                            labelText: 'Unit',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ReactiveTextField(
                    formControlName: 'marketName',
                    style: textTheme.bodyMedium,
                    decoration: const InputDecoration(
                      labelText: 'Market Name',
                    ),
                  ),
                  const SizedBox(height: 10),
                  ReactiveTextField(
                    formControlName: 'notes',
                    style: textTheme.bodyMedium,
                    decoration: const InputDecoration(
                      labelText: 'Notes',
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 20),
                  Consumer(builder: (context, ref, child) {
                    final state =
                        ref.watch(fridgeItemController(editedModel?.id ?? 0));
                    final provider = ref.read(
                        fridgeItemController(editedModel?.id ?? 0).notifier);
                    return BoxButton(
                      loading: state.add.isLoading || state.edit.isLoading,
                      onPressed: () async {
                        if (form.valid && selectedCategoryValue != null) {
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
                                        : "Added item to refrigerator successfuly",
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
