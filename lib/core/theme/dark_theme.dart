import 'package:flutter/material.dart';
import 'package:stylesh/core/utils/app_colors.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  fontFamily: 'Montserrat',

  // ── COLOR SCHEME ─────────────────────────────────────
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
    surface: AppColors.darkScaffoldBg,
    error: AppColors.primaryColor,
    onPrimary: AppColors.whiteColor,
    onSecondary: AppColors.whiteColor,
    onSurface: AppColors.darkTextPrimary,
    onError: AppColors.whiteColor,
  ),

  // ── SCAFFOLD ─────────────────────────────────────────
  scaffoldBackgroundColor: AppColors.darkScaffoldBg,

  // ── APPBAR ───────────────────────────────────────────
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkScaffoldBg,
    foregroundColor: AppColors.darkTextPrimary,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.darkTextPrimary),
    titleTextStyle: TextStyle(
      color: AppColors.darkTextPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),

  // ── ELEVATED BUTTON ──────────────────────────────────
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.whiteColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      minimumSize: const Size(double.infinity, 50),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),

  // ── TEXT BUTTON ──────────────────────────────────────
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),

  // ── OUTLINED BUTTON ──────────────────────────────────
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      side: const BorderSide(color: AppColors.primaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),

  // ── INPUT DECORATION ─────────────────────────────────
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.darkCardBg,
    hintStyle: const TextStyle(
      color: AppColors.darkTextHint,
      fontSize: 14,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.darkBorderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.darkBorderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.primaryColor),
    ),
  ),

  // ── TEXT THEME ───────────────────────────────────────
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: AppColors.darkTextPrimary, fontWeight: FontWeight.w700),
    displayMedium: TextStyle(color: AppColors.darkTextPrimary, fontWeight: FontWeight.w700),
    headlineLarge: TextStyle(color: AppColors.darkTextPrimary, fontWeight: FontWeight.w700, fontSize: 28),
    headlineMedium: TextStyle(color: AppColors.darkTextPrimary, fontWeight: FontWeight.w600, fontSize: 22),
    headlineSmall: TextStyle(color: AppColors.darkTextPrimary, fontWeight: FontWeight.w600, fontSize: 18),
    titleLarge: TextStyle(color: AppColors.darkTextPrimary, fontWeight: FontWeight.w600, fontSize: 16),
    titleMedium: TextStyle(color: AppColors.darkTextSecondary, fontWeight: FontWeight.w500, fontSize: 14),
    titleSmall: TextStyle(color: AppColors.darkTextMuted, fontWeight: FontWeight.w500, fontSize: 12),
    bodyLarge: TextStyle(color: AppColors.darkTextPrimary, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.darkTextSecondary, fontSize: 14),
    bodySmall: TextStyle(color: AppColors.darkTextMuted, fontSize: 12),
    labelLarge: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.w600, fontSize: 16),
    labelSmall: TextStyle(color: AppColors.darkTextHint, fontSize: 11),
  ),

  // ── ICON ─────────────────────────────────────────────
  iconTheme: const IconThemeData(
    color: AppColors.darkTextPrimary,
    size: 24,
  ),

  // ── BOTTOM NAV BAR ───────────────────────────────────
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkSurfaceBg,
    selectedItemColor: AppColors.navActive,
    unselectedItemColor: AppColors.darkNavInactive,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),

  // ── CARD ─────────────────────────────────────────────
  cardTheme: CardThemeData(
    color: AppColors.darkCardBg,
    elevation: 2,
    shadowColor: AppColors.blackColor.withOpacity(0.3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  // ── DIVIDER ──────────────────────────────────────────
  dividerTheme: const DividerThemeData(
    color: AppColors.darkDividerColor,
    thickness: 1,
  ),

  // ── CHIP ─────────────────────────────────────────────
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.darkCardBg,
    selectedColor: AppColors.primaryColor,
    labelStyle: const TextStyle(color: AppColors.darkTextSecondary, fontSize: 12),
    secondaryLabelStyle: const TextStyle(color: AppColors.whiteColor, fontSize: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
      side: const BorderSide(color: AppColors.darkBorderColor),
    ),
  ),

  // ── CHECKBOX ─────────────────────────────────────────
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return AppColors.primaryColor;
      return AppColors.darkCardBg;
    }),
    checkColor: WidgetStateProperty.all(AppColors.whiteColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ),

  // ── PROGRESS INDICATOR ───────────────────────────────
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.primaryColor,
  ),
);