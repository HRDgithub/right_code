// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:right_code_app/src/app/refrigerator/application/fridge_controller.dart';
import 'package:right_code_app/src/app/refrigerator/application/fridge_provider.dart';
import 'package:right_code_app/src/app/refrigerator/domain/fridge_category/fridge_category_model.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/widgets/box_button.dart';
import 'package:right_code_app/widgets/cotegory_name_picker_dialog.dart';
import 'package:right_code_app/widgets/custom_category_widget_view.dart';

class FridgeAddNewCatgeoryWidget extends ConsumerWidget {
  const FridgeAddNewCatgeoryWidget({
    super.key,
    required this.isSelected,
    required this.onPressed,
  });
  final bool Function(FridgeCategoryModel item) isSelected;
  final void Function(FridgeCategoryModel item) onPressed;

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: CustomCategoryStreamWidget<FridgeCategoryModel>(
            dataProvider: getFridgeCategoryStreamProvider,
            isSelected: isSelected,
            onPressed: onPressed,
            title: (item) {
              return item.name;
            },
          )),
          BoxButton(
            loading: ref.watch(fridgeCategoryController).isLoading,
            margin: const EdgeInsets.only(left: 10),
            raduis: AppTheme.raduisCirlce,
            onPressed: () async {
              await categoryNamePickerDialog(
                hintText: "Fruits",
                onPressed: (name) async {
                  await ref
                      .read(fridgeCategoryController.notifier)
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
  }
}
