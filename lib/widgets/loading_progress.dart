import 'package:flutter/material.dart';
import 'package:right_code_app/theme/theme.dart';

class LoadingProgress extends StatelessWidget {
  final double? dimension;
  final Color? color;
  const LoadingProgress({super.key, this.dimension, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: dimension ?? 30,
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: color ?? AppTheme.primary,
            strokeCap: StrokeCap.round,
          ),
        ),
      ),
    );
  }
}
