import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/features/onboarding/data/onboarding_model.dart';
import 'package:stylesh/features/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:stylesh/features/onboarding/presentation/widgets/onboarding_skip_buttom.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${_currentIndex + 1}',
                          style: AppTextStyles.montserratSemiBold18w600
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                        TextSpan(
                          text: '/${onBoardingData.length}',
                          style: AppTextStyles.montserratSemiBold18w600
                              .copyWith(color: AppColors.textGray),
                        ),
                      ],
                    ),
                  ),
                  OnboardingSkipButton(controller: _controller),
                ],
              ),
              SizedBox(height: 110.h),
              Expanded(
                child: OnBoardingBody(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: _currentIndex != 0,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: TextButton(
                      onPressed: () {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(
                        'Prev',
                        style: AppTextStyles.montserratSemiBold18w600.copyWith(
                          color: AppColors.textGray,
                        ),
                      ),
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
                  TextButton(
                    onPressed: () {
                      if (_currentIndex < onBoardingData.length - 1) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // Navigate to the next screen or perform any action
                      }
                    },
                    child: Text(
                      'Next',
                      style: AppTextStyles.montserratSemiBold18w600.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
