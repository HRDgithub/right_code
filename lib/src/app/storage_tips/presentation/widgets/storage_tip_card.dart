import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:right_code_app/src/app/storage_tips/application/storage_tip_controller.dart';
import 'package:right_code_app/src/app/storage_tips/domain/storage_tip/storage_tip_model.dart';
import 'package:right_code_app/src/app/storage_tips/presentation/add_edit_item_storage_tips.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/widgets/box_button.dart';
import 'package:right_code_app/widgets/show_dialog.dart';
import 'package:right_code_app/widgets/text_widget.dart';

class StorageTipCard extends StatelessWidget {
  const StorageTipCard({super.key, required this.storageTipModel});
  final StorageTipModel storageTipModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: AppTheme.raduis, color: AppTheme.whiteText),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  storageTipModel.name,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
                TextWidget(
                  storageTipModel.details,
                  maxLines: 100,
                ),
              ],
            ),
          ),

          ///
          ///
          Consumer(builder: (context, ref, child) {
            final state =
                ref.watch(storageTipsItemController(storageTipModel.id));
            final provider = ref
                .read(storageTipsItemController(storageTipModel.id).notifier);
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
                        return AddEditItemStorageTipPage(
                          editedModel: storageTipModel,
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
                        await provider.removeItem(storageTipModel.id);
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
