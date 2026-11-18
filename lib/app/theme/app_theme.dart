import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Observed Splash colors, not a complete app-wide design system.
abstract final class AppColors {
  static const background = Color(0xFFFFFFFF);
  static const logoTeal = Color(0xFF004C4C);
  static const loaderTeal = Color(0xFF008080);
}

abstract final class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.logoTeal,
    useMaterial3: true,
  );

  // Keep actual device time/system icons; the Figma 9:41 is mock status text.
  static const systemOverlay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarContrastEnforced: false,
  );
}
