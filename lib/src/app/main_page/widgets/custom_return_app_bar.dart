import 'package:flutter/material.dart';
import 'package:right_code_app/src/app/main_page/widgets/my_logo.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/widgets/box_button.dart';

class CustomReturnBackAppBar extends StatelessWidget {
  const CustomReturnBackAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BoxButton(
            width: 60,
            onPressed: () async {
              Navigator.pop(context);
            },
            bgColor: AppTheme.primary,
            bgColorOpacity: 1,
            raduis: AppTheme.raduisCirlce,
            child: const Center(
              child: Icon(
                Icons.arrow_back_rounded,
                color: AppTheme.whiteText,
              ),
            ),
          ),
          buildMyLogo(),
        ],
      ),
    );
  }
}
