import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomSizedBox(
        width: double.infinity,
        height: 40,
        child: TextField(
          decoration: InputDecoration(
            fillColor: AppColors.whiteColor,
            filled: true,
            hintText: "search any product",
            hintStyle: AppTextStyles.montserratRegular14w400.copyWith(
              color: AppColors.hintTextMain,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: const Icon(
              Icons.search_outlined,
              color: AppColors.hintTextMain,
            ),
            suffixIcon: const Icon(
              Icons.mic,
              color: AppColors.hintTextMain,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: const BorderSide(color: AppColors.homeBg),
            ),
          ),
        ),
      ),
    );
  }
}
