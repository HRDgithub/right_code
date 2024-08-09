import 'package:flutter/material.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/widgets/loading_progress.dart';

class BoxButton extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final Widget? child;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final Color? bgColor;
  final double? bgColorOpacity;
  final EdgeInsets? margin;

  ///
  final bool? visible;
  final String? toolTip;
  final bool showOnTop;

  final bool? loading;

  ///
  final int notification;
  final Widget? notificationWidget;

  ///
  final BoxBorder? border;

  final Clip clipBehavior;

  final double? width;
  final double? height;
  final bool? enableHeight;
  final bool? enableWidth;
  final BorderRadiusGeometry? raduis;
  const BoxButton({
    super.key,
    this.child,
    this.onLongPress,
    this.icon,
    this.border,
    this.iconColor,
    this.iconSize,
    this.bgColor,
    this.visible = true,
    this.toolTip,
    this.margin,
    this.bgColorOpacity,
    this.height,
    this.width,
    this.raduis,
    this.showOnTop = true,
    this.enableHeight = true,
    this.enableWidth = true,
    this.loading = false,
    this.notification = 0,
    this.notificationWidget,
    this.clipBehavior = Clip.none,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible!,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: margin,
        width: enableWidth == true ? width ?? 45 : null,
        height: enableHeight == true ? height ?? 45 : null,
        clipBehavior: clipBehavior,
        decoration: bgColor != null
            ? BoxDecoration(
                border: border,
                color: bgColor?.withOpacity(bgColorOpacity ?? 0.25),
                borderRadius: raduis ?? AppTheme.raduis)
            : null,
        child: loading == true
            ? const LoadingProgress(
                dimension: 25,
                color: AppTheme.whiteText,
              )
            : Stack(
                children: [
                  Center(
                    child: Container(
                      child: _CustomTextButton(
                          onPressed: onPressed,
                          onLongPress: onLongPress,
                          raduis: raduis,
                          icon: icon,
                          iconColor: iconColor,
                          iconSize: iconSize,
                          child: child),
                    ),
                  ),

                  ///
                  ///
                  ///
                  ///* Notification Count Widget
                  notification == 0
                      ? const SizedBox()
                      : Positioned(
                          top: 4,
                          left: 4,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Center(
                              child: notificationWidget ??
                                  Text(
                                    notification > 99
                                        ? "+99"
                                        : notification.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontSize: 11.5,
                                          color: AppTheme.whiteText,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                            ),
                          ),
                        ),
                ],
              ),
      ),
    );
  }
}

class _CustomTextButton extends StatelessWidget {
  const _CustomTextButton({
    required this.onPressed,
    required this.raduis,
    required this.child,
    required this.icon,
    required this.iconColor,
    required this.iconSize,
    required this.onLongPress,
  });

  final void Function()? onPressed;
  final void Function()? onLongPress;
  final BorderRadiusGeometry? raduis;
  final Widget? child;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      child: Center(
        child: TextButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: Theme.of(context).textButtonTheme.style?.copyWith(
              shape: raduis != null
                  ? WidgetStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: raduis!))
                  : WidgetStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: AppTheme.raduis)),
              mouseCursor:
                  const WidgetStatePropertyAll(SystemMouseCursors.click)),
          child: Center(
            child: child ??
                Icon(
                  icon,
                  color: iconColor ?? Theme.of(context).iconTheme.color,
                  size: iconSize,
                ),
          ),
        ),
      ),
    );
  }
}
