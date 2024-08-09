import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/widgets/box_button.dart';
import 'package:right_code_app/widgets/loading_progress.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? lableText;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final bool hide;
  final bool enabeled;
  final Key? formKey;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool visible;

  //
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final Color? fillColor;
  final BorderRadius? raduis;
  final Color? errorTextColor;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?)? onSaved;
  final FocusNode? focusNode;
  final Function(PointerDownEvent)? onTapOutside;
  //
  final bool enableSuffixPadding;
  final bool enablePrefixPadding;

  //
  const CustomTextField(
      {super.key,
      this.maxLines,
      this.onSaved,
      this.contentPadding,
      this.errorTextColor,
      this.labelStyle,
      this.hintStyle,
      this.minLines,
      this.fillColor,
      this.hintText,
      this.keyboardType,
      this.formKey,
      this.enabeled = true,
      this.lableText,
      this.suffixIcon,
      this.preffixIcon,
      this.hide = false,
      this.controller,
      this.validator,
      this.onChanged,
      this.margin,
      this.raduis,
      this.inputFormatters,
      this.focusNode,
      this.onTap,
      this.enablePrefixPadding = true,
      this.enableSuffixPadding = true,
      this.onTapOutside,
      this.visible = true,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        margin: margin ?? defualtSpace,
        child: TextFormField(
          focusNode: focusNode,
          onTapOutside: onTapOutside ??
              (event) => FocusManager.instance.primaryFocus?.unfocus(),
          key: formKey,
          enabled: enabeled,
          controller: controller,
          inputFormatters: inputFormatters,
          style:
              Theme.of(context).textTheme.bodyMedium?.copyWith(fontFamily: ""),
          keyboardType: keyboardType,
          maxLines: maxLines,
          minLines: minLines,
          validator: validator,
          obscureText: hide,
          maxLength: maxLength,
          onChanged: onChanged,
          onSaved: onSaved,
          onTap: onTap,
          decoration: InputDecoration(
            contentPadding: contentPadding ?? defaultContentPadding,
            hintText: hintText,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: enableSuffixPadding ? 5 : 0),
                    child: suffixIcon,
                  )
                : null,
            prefixIcon: preffixIcon != null
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: enablePrefixPadding ? 5 : 0),
                    child: preffixIcon,
                  )
                : null,
            hintStyle: hintStyle,
            labelText: lableText,
            labelStyle: labelStyle,
            alignLabelWithHint: true,
            fillColor: fillColor,
          ),
        ),
      ),
    );
  }
}

class CustomBoxButtonTextField extends StatelessWidget {
  const CustomBoxButtonTextField(
      {super.key,
      required this.onPressed,
      this.visible = true,
      required this.iconData,
      this.isSameValue = false,
      required this.isLoading,
      this.iconSize = 20});
  final void Function()? onPressed;
  final bool isLoading;
  final bool isSameValue;
  final IconData iconData;
  final double iconSize;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            BoxButton(
              icon: iconData,
              iconSize: iconSize,
              visible: !isSameValue,
              width: 35,
              height: 35,
              raduis: BorderRadius.circular(50),
              iconColor: AppTheme.primary,
              onPressed: isLoading && !isSameValue ? null : onPressed,
              child: isLoading
                  ? const Center(
                      child: LoadingProgress(
                        dimension: 23,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
