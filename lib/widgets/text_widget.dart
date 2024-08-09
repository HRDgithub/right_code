import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final double? textOpacity;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;

  final DateTime? date;
  final String? fontFamily;
  final TextAlign? textAlign;
  final double? height;
  final Function()? onTap;

  const TextWidget(
    this.text, {
    super.key,
    this.style,
    this.maxLines = 1,
    this.fontFamily,
    this.textOpacity = 1,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.date,
    this.textAlign,
    this.onTap,
    this.height,
  });

  @override
  TextWidgetState createState() => TextWidgetState();
}

class TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    final textStyle = widget.style ?? Theme.of(context).textTheme.bodyMedium;

    return GestureDetector(
      onTap: widget.onTap,
      child: Text(
        widget.text,
        maxLines: widget.maxLines,
        overflow: TextOverflow.ellipsis,
        textAlign: widget.textAlign,
        style: widget.style ??
            TextStyle(
              decoration: TextDecoration.none,
              height: widget.height,
              overflow: TextOverflow.ellipsis,
              fontFamily: widget.fontFamily,
              color: widget.textColor?.withOpacity(widget.textOpacity!) ??
                  textStyle?.color?.withOpacity(widget.textOpacity!),
              fontSize: widget.fontSize ?? textStyle?.fontSize,
              fontWeight: widget.fontWeight ?? textStyle?.fontWeight,
            ),
      ),
    );
  }
}
