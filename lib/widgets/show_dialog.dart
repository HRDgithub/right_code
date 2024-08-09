// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/widgets/box_button.dart';
import 'package:right_code_app/widgets/text_widget.dart';

enum AlertDialogStatus { success, error, action, warning }

Future<void> showWarningDialog({
  String? buttonText,
  String? cancelText,
  Function()? onActionPressed,
  Function()? onCancelPressed,
  Function()? onOkPressed,
  required AlertDialogStatus status,
  required String header,
  required String title,
  bool backDismiss = true,
  bool hideAllButtons = false,
  final Widget? child,
}) async {
  ///
  ///
  await OneContext().showDialog(
    barrierDismissible: backDismiss,
    builder: (BuildContext context) {
      return DialogBody(
        header: header,
        title: title,
        buttonText: buttonText,
        cancelText: cancelText,
        onActionPressed: onActionPressed,
        onCancelPressed: onCancelPressed,
        onOkPressed: onOkPressed,
        hideAllButtons: hideAllButtons,
        status: status,
        child: child,
      );
    },
  );
}

class DialogBody extends StatelessWidget {
  const DialogBody(
      {super.key,
      this.buttonText,
      this.cancelText,
      this.onActionPressed,
      this.onCancelPressed,
      this.onOkPressed,
      required this.header,
      required this.title,
      this.child,
      this.hideAllButtons = false,
      this.status = AlertDialogStatus.error});

  final String? buttonText;
  final String? cancelText;
  final Function()? onActionPressed;
  final Function()? onCancelPressed;
  final Function()? onOkPressed;
  final AlertDialogStatus status;
  final String header;
  final String title;
  final bool backDismiss = true;
  final bool hideAllButtons;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    ///* Functions
    Color statusColor() {
      switch (status) {
        case AlertDialogStatus.error:
          return Colors.red.shade400;
        case AlertDialogStatus.success:
          return Colors.green.shade400;
        case AlertDialogStatus.action:
          return AppTheme.primary;
        case AlertDialogStatus.warning:
          return Colors.orange.shade400;
        default:
          return AppTheme.bgColor;
      }
    }

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 600, maxWidth: 450),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppTheme.bgColor,
          borderRadius: AppTheme.raduis,
          border: Border.all(width: 2, color: statusColor()),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              borderOnForeground: false,
              color: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              child: child ??
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 12, left: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///
                        ///
                        ///
                        TextWidget(
                          header,
                          fontWeight: FontWeight.w500,
                          fontSize: 21,
                        ),
                        const SizedBox(height: 5),
                        TextWidget(
                          title,
                          fontWeight: FontWeight.w400,
                          textOpacity: 1,
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ),
            ),
            hideAllButtons ? const SizedBox() : const SizedBox(height: 30),
            Visibility(
              visible:
                  hideAllButtons ? false : status == AlertDialogStatus.action,
              child: Row(
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
                        onActionPressed?.call();
                      },
                      bgColorOpacity: 0.65,
                      bgColor: statusColor(),
                      child: TextWidget(
                        buttonText ?? "Ok",
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
                        onCancelPressed?.call();
                      },
                      bgColorOpacity: 0.4,
                      bgColor: AppTheme.buttonColor,
                      child: TextWidget(
                        cancelText ?? "Cancel",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible:
                  hideAllButtons ? false : status != AlertDialogStatus.action,
              child: Row(
                children: [
                  ///* OK
                  Expanded(
                    child: BoxButton(
                      raduis: AppTheme.raduis * 0.6,
                      width: double.infinity,
                      onPressed: () async {
                        await OneContext().popDialog();
                        onOkPressed?.call();
                      },
                      bgColorOpacity: 0.65,
                      bgColor: statusColor(),
                      child: TextWidget(
                        buttonText ?? "OK",
                        fontWeight: FontWeight.w500,
                        textColor: AppTheme.whiteText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
