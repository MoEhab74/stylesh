import 'package:flutter/material.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Montserrat',

  // ── COLOR SCHEME ─────────────────────────────────────
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
    surface: AppColors.scaffoldBg,
    error: AppColors.primaryColor,
    onPrimary: AppColors.whiteColor,
    onSecondary: AppColors.whiteColor,
    onSurface: AppColors.secondaryColor,
    onError: AppColors.whiteColor,
  ),

  // ── SCAFFOLD ─────────────────────────────────────────
  scaffoldBackgroundColor: AppColors.scaffoldBg,

  // ── APPBAR ───────────────────────────────────────────
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.scaffoldBg,
    foregroundColor: AppColors.secondaryColor,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.secondaryColor),
    titleTextStyle: TextStyle(
      color: AppColors.secondaryColor,
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      minimumSize: const Size(double.infinity, 50),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),

  // ── TEXT BUTTON ──────────────────────────────────────
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      textStyle: AppTextStyles.montserratSemiBold14w600.copyWith(
        color: AppColors.primaryColor,
      ),
    ),
  ),

  // ── OUTLINED BUTTON ──────────────────────────────────
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      side: const BorderSide(color: AppColors.primaryColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),

  // ── INPUT DECORATION ─────────────────────────────────
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.cardBg,
    hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 14),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.borderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.borderColor),
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
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: AppColors.secondaryColor,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      color: AppColors.secondaryColor,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      color: AppColors.secondaryColor,
      fontWeight: FontWeight.w700,
      fontSize: 28,
    ),
    headlineMedium: TextStyle(
      color: AppColors.secondaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 22,
    ),
    headlineSmall: TextStyle(
      color: AppColors.secondaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    titleLarge: TextStyle(
      color: AppColors.secondaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    titleMedium: TextStyle(
      color: AppColors.textSecondary,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    titleSmall: TextStyle(
      color: AppColors.textMuted,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
    bodyLarge: TextStyle(color: AppColors.secondaryColor, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 14),
    bodySmall: TextStyle(color: AppColors.textMuted, fontSize: 12),
    labelLarge: TextStyle(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    labelSmall: TextStyle(color: AppColors.textHint, fontSize: 11),
  ),

  // ── ICON ─────────────────────────────────────────────
  iconTheme: const IconThemeData(color: AppColors.secondaryColor, size: 24),

  // ── BOTTOM NAV BAR ───────────────────────────────────
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.scaffoldBg,
    selectedItemColor: AppColors.navActive,
    unselectedItemColor: AppColors.navInactive,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),

  // ── CARD ─────────────────────────────────────────────
  cardTheme: CardThemeData(
    color: AppColors.scaffoldBg,
    elevation: 2,
    shadowColor: AppColors.blackColor.withOpacity(0.08),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),

  // ── DIVIDER ──────────────────────────────────────────
  dividerTheme: const DividerThemeData(
    color: AppColors.dividerColor,
    thickness: 1,
  ),

  // ── CHIP ─────────────────────────────────────────────
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.cardBg,
    selectedColor: AppColors.primaryColor,
    labelStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
    secondaryLabelStyle: const TextStyle(
      color: AppColors.whiteColor,
      fontSize: 12,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
      side: const BorderSide(color: AppColors.borderColor),
    ),
  ),

  // ── CHECKBOX ─────────────────────────────────────────
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return AppColors.primaryColor;
      return AppColors.whiteColor;
    }),
    checkColor: WidgetStateProperty.all(AppColors.whiteColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ),

  // ── PROGRESS INDICATOR ───────────────────────────────
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.primaryColor,
  ),
);
