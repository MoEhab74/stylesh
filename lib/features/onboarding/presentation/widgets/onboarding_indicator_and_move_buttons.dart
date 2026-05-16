import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylesh/core/routing/app_routes.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/app_strings.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/features/onboarding/data/onboarding_model.dart';
import 'package:stylesh/features/onboarding/presentation/widgets/onboarding_text_button.dart';

class OnBoardingIndicatorAndMoveButtons extends StatelessWidget {
  const OnBoardingIndicatorAndMoveButtons({
    super.key,
    required int currentIndex,
    required PageController controller,
  }) : _currentIndex = currentIndex,
       _controller = controller;

  final int _currentIndex;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: _currentIndex != 0,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: OnBoardingTextButton(
            currentIndex: _currentIndex,
            controller: _controller,
            text: AppStrings.prev,
            textStyle: AppTextStyles.montserratSemiBold18w600.copyWith(
              color: AppColors.textDarkGray,
            ),
            onPressed: () {
              if (_currentIndex > 0) {
                _controller.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
        SmoothPageIndicator(
          controller: _controller, // PageController
          count: onBoardingData.length,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.secondaryColor,
            dotWidth: 10,
            dotHeight: 10,
            radius: 5,
          ), // your preferred effect
          onDotClicked: (index) {
            _controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
        OnBoardingTextButton(
          currentIndex: _currentIndex,
          controller: _controller,
          text: _currentIndex == onBoardingData.length - 1
              ? AppStrings.getStarted
              : AppStrings.next,
          textStyle: AppTextStyles.montserratSemiBold18w600.copyWith(
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            if (_currentIndex < onBoardingData.length - 1) {
              _controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              // Navigate to the next screen, e.g., Login
              GoRouter.of(context).pushReplacement(AppRoutes.login);
            }
          },
        ),
      ],
    );
  }
}
