import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:right_code_app/src/app/refrigerator/application/fridge_controller.dart';
import 'package:right_code_app/src/app/refrigerator/domain/fridge_model/fridge_model.dart';
import 'package:right_code_app/src/app/refrigerator/presentation/add_edit_item_refrigerator_page.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/widgets/box_button.dart';
import 'package:right_code_app/widgets/image_widgets.dart';
import 'package:right_code_app/widgets/show_dialog.dart';
import 'package:right_code_app/widgets/text_widget.dart';

class RefrigeratorItemWidget extends StatelessWidget {
  const RefrigeratorItemWidget({
    super.key,
    required this.fridgeModel,
  });
  final FridgeModel fridgeModel;

  @override
  Widget build(BuildContext context) {
    final dateToExpireInDays =
        fridgeModel.expireDate.difference(DateTime.now()).inDays;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: AppTheme.raduis,
        color: AppTheme.whiteText,
      ),
      child: Row(
        children: [
          Center(
            child: Container(
              width: 55,
              height: 55,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppTheme.secnodry),
              child: Center(
                child: ClipRRect(
                    borderRadius: AppTheme.raduisCirlce,
                    child: CustomImageNetwork(
                        dimension: 55, url: fridgeModel.imgUrl)),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                fridgeModel.name,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextWidget(
                      dateToExpireInDays < 0
                          ? "Expired"
                          : "${dateToExpireInDays.toString()} Days",
                      textColor:
                          dateToExpireInDays < 2 ? Colors.red.shade400 : null,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                      child: TextWidget(
                          "${fridgeModel.quantity} ${fridgeModel.unit}")),
                ],
              )
            ],
          )),
          Consumer(builder: (context, ref, child) {
            final state = ref.watch(fridgeItemController(fridgeModel.id));
            final provider =
                ref.read(fridgeItemController(fridgeModel.id).notifier);
            return Column(
              children: [
                BoxButton(
                  width: 35,
                  height: 35,
                  icon: Iconsax.edit_outline,
                  loading: state.edit.isLoading,
                  bgColor: AppTheme.primary,
                  onPressed: () async {
                    await Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AddEditItemRefrigeratorPage(
                          editedModel: fridgeModel,
                        );
                      },
                    ));
                  },
                ),
                const SizedBox(height: 5),
                BoxButton(
                  width: 35,
                  height: 35,
                  loading: state.delete.isLoading,
                  icon: Iconsax.trash_outline,
                  bgColor: Colors.red,
                  onPressed: () async {
                    await showWarningDialog(
                      header: "Delete Item",
                      title: "Do you want to delete this item ?",
                      buttonText: "Yes",
                      status: AlertDialogStatus.action,
                      onActionPressed: () async {
                        await provider.removeItem(fridgeModel.id);
                      },
                    );
                  },
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
