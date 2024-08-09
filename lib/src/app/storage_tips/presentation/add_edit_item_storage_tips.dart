// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:right_code_app/src/app/main_page/widgets/custom_return_app_bar.dart';
import 'package:right_code_app/src/app/storage_tips/application/storage_tip_controller.dart';
import 'package:right_code_app/src/app/storage_tips/application/storage_tip_form_provider.dart';
import 'package:right_code_app/src/app/storage_tips/domain/storage_tip/storage_tip_model.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/utils/context_extantions.dart';
import 'package:right_code_app/widgets/box_button.dart';
import 'package:right_code_app/widgets/fridge_category_widget/fridge_add_new_catgeory_widget.dart';
import 'package:right_code_app/widgets/show_dialog.dart';
import 'package:right_code_app/widgets/text_widget.dart';

class AddEditItemStorageTipPage extends HookWidget {
  const AddEditItemStorageTipPage({
    super.key,
    this.editedModel,
  });
  final StorageTipModel? editedModel;

  @override
  Widget build(BuildContext context) {
    //* UseStates
    final selectCategoryUseState = useState<String?>(editedModel?.category);

    //* Values
    final selectedCategoryValue = selectCategoryUseState.value;

    //* Others
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
              return ref.watch(storageTipsFormProvider(editedModel));
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
                        "Add item to your Storage Tips",
                        textOpacity: 0.8,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  ///* Same Category as Fridge Category
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
                  ReactiveTextField(
                    formControlName: 'name',
                    style: textTheme.bodyMedium,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 10),
                  ReactiveTextField(
                    formControlName: 'details',
                    style: textTheme.bodyMedium,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'Details',
                    ),
                  ),

                  const SizedBox(height: 20),
                  Consumer(builder: (context, ref, child) {
                    final state = ref
                        .watch(storageTipsItemController(editedModel?.id ?? 0));
                    final provider = ref.read(
                        storageTipsItemController(editedModel?.id ?? 0)
                            .notifier);
                    return BoxButton(
                      loading: state.add.isLoading || state.edit.isLoading,
                      onPressed: () async {
                        if (form.valid && selectedCategoryValue != null) {
                          await provider
                              .addOrUpdateItem(
                            form: form,
                            editedModel: editedModel,
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
                                        : "Added item to Storage Tips successfuly",
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
