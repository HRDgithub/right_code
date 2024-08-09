import 'package:flutter/material.dart';
import 'package:right_code_app/src/app/main_page/widgets/my_logo.dart';
import 'package:right_code_app/theme/theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildMyLogo(),
          const Icon(Icons.notifications, size: 35, color: AppTheme.secnodry),
        ],
      ),
    );
  }
}
