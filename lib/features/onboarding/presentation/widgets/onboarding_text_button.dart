import 'package:flutter/material.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/app_strings.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/features/onboarding/data/onboarding_model.dart';

class OnBoardingTextButton extends StatelessWidget {
  const OnBoardingTextButton({
    super.key,
    required int currentIndex,
    required PageController controller,
    this.onPressed,
    required this.text,
    this.textStyle,
  }) : _currentIndex = currentIndex,
       _controller = controller;

  final int _currentIndex;
  final PageController _controller;
  final void Function()? onPressed;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      // Next button will be replaced with Get Started and prev stays the same
      // Check if the text = 'Next' and if we are on the last page, then change the text to 'Get Started'
      child: Text(
        _currentIndex == onBoardingData.length - 1 && text == AppStrings.next
            ? AppStrings.getStarted
            : text,
        style:
            textStyle ??
            AppTextStyles.montserratSemiBold18w600.copyWith(
              color: AppColors.primaryColor,
            ),
      ),
    );
  }
}
