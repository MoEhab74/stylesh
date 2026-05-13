import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/features/onboarding/data/onboarding_model.dart';
import 'package:stylesh/features/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:stylesh/features/onboarding/presentation/widgets/onboarding_indicator_and_move_buttons.dart';
import 'package:stylesh/features/onboarding/presentation/widgets/onboarding_skip_buttom.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  // _controller to control the PageView and PageIndicator
  final PageController _controller = PageController(initialPage: 0);
  // _currentIndex to tell us which page we are on
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
              // SmoothPageIndicator and Move Buttons (Prev, Next, Get Started)
              OnBoardingIndicatorAndMoveButtons(
                currentIndex: _currentIndex,
                controller: _controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
