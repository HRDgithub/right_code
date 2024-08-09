import 'package:flutter/material.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/widgets/text_widget.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    this.child,
    this.dimension = 30,
    required this.isActive,
    required this.title,
    required this.iconPath,
  });

  final String iconPath;
  final String title;
  final double? dimension;
  final Widget? child;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox.square(
              dimension: dimension,
              child: Center(
                child: Image(
                  image: AssetImage(iconPath),
                  alignment: Alignment.center,
                  color: isActive
                      ? AppTheme.whiteText
                      : AppTheme.darkText.withOpacity(0.7),
                ),
              ),
            ),
          ),

          ///
          const SizedBox(height: 2.5),

          ///
          Flexible(
            child: TextWidget(
              title,
              textColor: isActive
                  ? AppTheme.whiteText
                  : AppTheme.darkText.withOpacity(0.7),
              fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
              fontSize: 14,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
