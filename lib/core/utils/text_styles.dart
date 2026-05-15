import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle montserratExtraBold24w800 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.secondaryColor,
  );
  static TextStyle montserratExtraBold36w700 = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.secondaryColor,
  );
  static const TextStyle montserrat16w600 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );

  static TextStyle montserratSemiBold14w600 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );
  static TextStyle montserratSemiBold11w500 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );
  static TextStyle montserratSemiBold18w600 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
  static TextStyle montserrat12w400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );
  static TextStyle montserratRegular14w400 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
  static TextStyle montserratMedium12w500 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textMuted,
  );
  static TextStyle montserratSemiBold20w600 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
  static TextStyle montserratHintTextStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textHint,
  );
  
}
