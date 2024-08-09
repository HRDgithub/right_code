import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:right_code_app/widgets/text_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Iconsax.user_bold,
              size: 38,
            ),
            SizedBox(width: 10),
            TextWidget(
              "Profile Page",
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
