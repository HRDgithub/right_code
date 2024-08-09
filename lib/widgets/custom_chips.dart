import 'package:flutter/material.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/widgets/box_button.dart';
import 'package:right_code_app/widgets/text_widget.dart';

class CustomChipWidget extends StatelessWidget {
  const CustomChipWidget({
    super.key,
    required this.title,
    this.child,
    required this.onPressed,
    this.isSelected = false,
  });
  final String title;
  final Widget? child;
  final void Function() onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BoxButton(
        margin: const EdgeInsets.only(right: 5),
        enableWidth: false,
        height: 45,
        raduis: AppTheme.raduis * 2,
        bgColor: isSelected ? const Color(0xff575e71) : AppTheme.whiteText,
        bgColorOpacity: isSelected ? 0.85 : 1,
        onPressed: onPressed,
        child: child ??
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextWidget(
                title,
                fontWeight: FontWeight.w500,
                textColor: isSelected ? AppTheme.whiteText : AppTheme.darkText,
              ),
            ),
      ),
    );
  }
}
