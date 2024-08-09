import 'package:flutter/material.dart';

class AppTheme {
  static const bgColor = Color(0xffe4e5f6);
  static const primary = Color(0xff75507a);
  static const secnodry = Color(0xff575e71);
  static const buttonColor = Color(0xff141b2c);

  ///
  final accentColor = const Color(0xfff26522);
  final darkThemeTextColor = Colors.white;

  ///
  static const fontName = "";

  ///
  ///
  static const whiteText = Color.fromARGB(255, 255, 255, 255);
  static const darkText = Color.fromARGB(255, 0, 0, 0);

  static final raduis = BorderRadius.circular(12);
  static final raduisCirlce = BorderRadius.circular(500);

  ///
  ///
  ThemeData theme({bool isDark = false}) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: bgColor,
      fontFamily: fontName,
      appBarTheme: appBarTheme(isDark),
      textTheme: initTextStyle(isDark),
      pageTransitionsTheme: pageTransitions(),
      cardTheme: cardTheme(isDark),
      inputDecorationTheme: textFieldTheme(isDark),
      indicatorColor: secnodry,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: isDark ? whiteText : darkText,
      ),
      dividerTheme: DividerThemeData(
        color: isDark
            ? AppTheme.whiteText.withOpacity(0.25)
            : AppTheme.darkText.withOpacity(0.25),
        space: 5,
      ),
      chipTheme: ChipThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: raduis, side: BorderSide.none),
        side: BorderSide.none,
        backgroundColor: whiteText,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        hoverColor: AppTheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: OutlineInputBorder(
          borderRadius: raduis / 1.5,
        ),
      ),
      textButtonTheme: textButtonStyle(isDark),
      iconTheme: IconThemeData(
        color: isDark ? whiteText : darkText,
      ),
      iconButtonTheme: iconButtonTheme(isDark),
      primaryIconTheme: const IconThemeData(
        color: whiteText,
      ),
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (context) {
          return const Icon(
            Icons.arrow_back,
            size: 22,
            color: whiteText,
          );
        },
      ),
      tooltipTheme: const TooltipThemeData(),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primary,
        selectionColor: primary.withOpacity(0.5),
        selectionHandleColor: primary,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
        side: WidgetStatePropertyAll(borderSide()),
        minimumSize: const WidgetStatePropertyAll(
          Size(100, 200),
        ),
        maximumSize: const WidgetStatePropertyAll(
          Size(100, 400),
        ),
      )),
      toggleButtonsTheme: const ToggleButtonsThemeData(
        color: primary,
        selectedColor: Colors.white,
        borderColor: primary,
      ),
      elevatedButtonTheme: buttonTheme(isDark),
      primaryColor: primary,
    );
  }

  IconButtonThemeData iconButtonTheme(bool isDark) {
    return IconButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0),
        maximumSize: const WidgetStatePropertyAll(Size(45, 45)),
        minimumSize: const WidgetStatePropertyAll(Size(45, 45)),
        iconColor: WidgetStatePropertyAll(isDark ? whiteText : darkText),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: raduis / 1.5),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(0)),
        mouseCursor: const WidgetStatePropertyAll(SystemMouseCursors.click),
        surfaceTintColor: WidgetStatePropertyAll(
          primary.withOpacity(0.2),
        ),
        overlayColor: WidgetStatePropertyAll(
          primary.withOpacity(0.2),
        ),
      ),
    );
  }

  TextButtonThemeData textButtonStyle(bool isDark) {
    return TextButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: raduis / 1.5),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(0)),
        mouseCursor: const WidgetStatePropertyAll(SystemMouseCursors.click),
        overlayColor: WidgetStatePropertyAll(
          primary.withOpacity(0.2),
        ),
      ),
    );
  }

  InputDecorationTheme textFieldTheme(bool isDark) {
    final color =
        isDark ? whiteText.withOpacity(0.7) : darkText.withOpacity(0.7);
    final borderRaduis = raduis;
    return InputDecorationTheme(
      contentPadding: defaultContentPadding,
      fillColor: whiteText,
      helperStyle: initTextStyle(isDark).bodySmall,
      errorStyle: initTextStyle(isDark)
          .bodyMedium
          ?.copyWith(color: Colors.redAccent.shade400),
      filled: true,
      labelStyle: initTextStyle(isDark)
          .bodyMedium
          ?.copyWith(fontWeight: FontWeight.w500, color: color, fontSize: 15.5),
      isCollapsed: true,
      hintStyle: initTextStyle(isDark).bodySmall?.copyWith(color: color),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade300, width: 1),
        borderRadius: borderRaduis,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: borderSide(color: primary, width: 1.5),
        borderRadius: borderRaduis,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: borderRaduis,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: borderSide(),
        borderRadius: borderRaduis,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: borderRaduis,
      ),
    );
  }

  ElevatedButtonThemeData buttonTheme(bool isDark) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0),
        splashFactory: InkSparkle.splashFactory,
        backgroundColor: const WidgetStatePropertyAll(primary),
        foregroundColor: const WidgetStatePropertyAll(whiteText),
        overlayColor: WidgetStatePropertyAll(
          primary.withOpacity(0.75),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: raduis,
            side: isDark ? borderSide() : BorderSide.none,
          ),
        ),
      ),
    );
  }

  BorderSide borderSide({Color? color, double? width}) {
    return BorderSide(
      color: color ?? primary,
      width: width ?? 1,
    );
  }

  CardTheme cardTheme(bool isDark) {
    return CardTheme(
      color: secnodry,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: raduis),
      clipBehavior: Clip.hardEdge,
    );
  }

  PageTransitionsTheme pageTransitions() {
    return const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: OpenUpwardsPageTransitionsBuilder()
      },
    );
  }

  TextTheme initTextStyle(bool isDark) {
    const textColor = darkText;
    return const TextTheme(
      titleSmall: TextStyle(
        fontSize: 14.0,
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontSize: 16.0,
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      labelMedium: TextStyle(
        fontSize: 14.5,
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 20.0,
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodySmall: TextStyle(
        fontSize: 14.0,
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 16.0,
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 18.0,
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 25.0,
        fontFamily: fontName,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }

  AppBarTheme appBarTheme(bool isDark) {
    return AppBarTheme(
      toolbarHeight: 70,
      color: primary,
      iconTheme: const IconThemeData(color: whiteText),
      elevation: 3,
      scrolledUnderElevation: 3,
      surfaceTintColor: primary,
      actionsIconTheme: const IconThemeData(color: whiteText),
      centerTitle: true,
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: fontName,
          color: whiteText,
          fontWeight: FontWeight.w500,
          fontSize: 25.0,
        ),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: fontName,
          color: whiteText,
          fontWeight: FontWeight.w500,
          fontSize: 22.0,
        ),
      ).titleLarge,
    );
  }
}

EdgeInsets defualtSpace =
    const EdgeInsets.symmetric(horizontal: 10, vertical: 5);
const defaultContentPadding =
    EdgeInsets.symmetric(horizontal: 15, vertical: 15);
