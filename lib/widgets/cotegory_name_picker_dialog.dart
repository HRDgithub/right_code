import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:one_context/one_context.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/widgets/box_button.dart';
import 'package:right_code_app/widgets/show_dialog.dart';
import 'package:right_code_app/widgets/text_field.dart';
import 'package:right_code_app/widgets/text_widget.dart';

Future<void> categoryNamePickerDialog({
  required String hintText,
  String? title,
  required Function(String name) onPressed,
}) async {
  await showWarningDialog(
    header: "",
    title: "",
    hideAllButtons: true,
    status: AlertDialogStatus.action,
    child: HookBuilder(builder: (context) {
      final categoryNameUseState = useState<String>('');
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 5),
          TextWidget(
            title ?? "Choose a category name:",
            fontSize: 18,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: hintText,
            onChanged: (text) {
              if (text != null) {
                categoryNameUseState.value = text;
              }
            },
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///* OK
              Expanded(
                child: BoxButton(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  raduis: AppTheme.raduis * 0.6,
                  width: double.infinity,
                  onPressed: () async {
                    await OneContext().popDialog();
                    final name = categoryNameUseState.value;
                    if (name.isNotEmpty) {
                      onPressed(name);
                    }
                  },
                  bgColorOpacity: 0.65,
                  bgColor: AppTheme.primary,
                  child: const TextWidget(
                    "Ok",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              ///*Cancel
              Expanded(
                child: BoxButton(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  raduis: AppTheme.raduis * 0.6,
                  width: double.infinity,
                  onPressed: () async {
                    await OneContext().popDialog();
                  },
                  bgColorOpacity: 0.4,
                  bgColor: AppTheme.buttonColor,
                  child: const TextWidget(
                    "Cancel",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }),
  );
}
