import 'package:flutter/material.dart';
import 'package:stylesh/features/auth/login/presentation/views/login_view.dart';

abstract class AppColors {
  // 0xFFC4C4C4
  // #575757
  // ── PRIMARY ──────────────────────────────────────────
  static const primaryColor = Color(
    0xFFF83758,
  ); // Red/Pink — buttons, CTAs, active
  static const secondaryColor = Color(0xFF1D1D1D);

  static const textGray = Color(0xFFC4C4C4);

  // ── BACKGROUND ───────────────────────────────────────
  static const scaffoldBg = Color(0xFFFFFFFF);
  static const cardBg = Color(0xFFF5F5F5);
  static const splashBg = Color(0xFFF9F9F9);
  static const textFieldBg = Color(0xFFF3F3F3);

  // ── TEXT ─────────────────────────────────────────────
  static const textSecondary = Color(0xFF575757);
  static const textMuted = Color(0xFF676767);
  static const textHint = Color(0xFFA8A8A9);
  static const textDarkGray = Color(0XFFA8A8A9);
  static const iconColor = Color(0XFF626262);

  // ── ACCENT ───────────────────────────────────────────
  static const accentGreen = Color(0xFF3BB77E);
  static const accentBlue = Color(0xFF4392F9);
  static const accentYellow = Color(0xFFFFC107);

  // ── BORDER & DIVIDER ─────────────────────────────────
  static const borderColor = Color(0xFFA8A8A9);
  static const dividerColor = Color(0xFF575757);

  // ── SOCIAL BUTTONS ────────────────────────────────────
  static const socialBorder = Color(0xFFDDDDDD);

  // ── BADGE ─────────────────────────────────────────────
  static const cartBadge = Color(0xFFF83758);

  // ── BOTTOM NAV ────────────────────────────────────────
  static const navActive = Color(0xFFF83758);
  static const navInactive = Color(0xFFA8A8A9);

  // ── DISCOUNT TAG ──────────────────────────────────────
  static const discountRed = Color(0xFFF83758);

  // ── WHITE & BLACK ─────────────────────────────────────
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF000000);

  // ── DARK MODE COLORS ─────────────────────────────────
  static const darkScaffoldBg = Color(0xFF121212);
  static const darkSurfaceBg = Color(0xFF1E1E1E);
  static const darkCardBg = Color(0xFF2A2A2A);
  static const darkTextPrimary = Color(0xFFEEEEEE);
  static const darkTextSecondary = Color(0xFFAAAAAA);
  static const darkTextMuted = Color(0xFF777777);
  static const darkTextHint = Color(0xFF555555);
  static const darkBorderColor = Color(0xFF3A3A3A);
  static const darkDividerColor = Color(0xFF2E2E2E);
  static const darkNavInactive = Color(0xFF666666);
}
