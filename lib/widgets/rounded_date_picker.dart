import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:right_code_app/theme/theme.dart';

Future<DateTime?> pickDate(BuildContext context,
    {DateTime? initialDate, DateTime? firstDate, DateTime? lastDate}) {
  return showRoundedDatePicker(
    context: context,
    height: 450,
    theme: Theme.of(context).copyWith(
      primaryColor: AppTheme.primary,
      textTheme: Theme.of(context).textTheme,
      disabledColor: AppTheme.darkText.withOpacity(0.5),
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: AppTheme.primary,
            onPrimary: AppTheme.primary,
            onSurface: AppTheme.primary,
          ),
    ),
    barrierDismissible: true,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    borderRadius: 12,
  );
}
