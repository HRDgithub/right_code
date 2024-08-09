import 'package:flutter/material.dart';

InputDecoration defaultInputDecoration({
  EdgeInsetsGeometry? contentPadding,
  String? hintText,
  Widget? suffixIcon,
  Widget? prefixIcon,
  TextStyle? hintStyle,
  String? labelText,
  TextStyle? labelStyle,
  Color? fillColor,
  bool enableSuffixPadding = false,
  bool enablePrefixPadding = false,
}) {
  return InputDecoration(
    contentPadding:
        contentPadding ?? const EdgeInsets.symmetric(vertical: 15.0),
    hintText: hintText,
    suffixIcon: suffixIcon != null
        ? Padding(
            padding:
                EdgeInsets.symmetric(horizontal: enableSuffixPadding ? 5 : 0),
            child: suffixIcon,
          )
        : null,
    prefixIcon: prefixIcon != null
        ? Padding(
            padding:
                EdgeInsets.symmetric(horizontal: enablePrefixPadding ? 5 : 0),
            child: prefixIcon,
          )
        : null,
    hintStyle: hintStyle,
    labelText: labelText,
    labelStyle: labelStyle,
    alignLabelWithHint: true,
    fillColor: fillColor,
    filled: fillColor != null,
  );
}
