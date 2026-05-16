import 'package:flutter/material.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/app_strings.dart';
import 'package:stylesh/core/utils/text_styles.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({super.key, this.controller});
  final PageController? controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          // Handle skip action
          if (controller != null) {
            controller!.animateToPage(
              2,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Text(
          AppStrings.skip,
          style: AppTextStyles.montserratSemiBold18w600.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}
