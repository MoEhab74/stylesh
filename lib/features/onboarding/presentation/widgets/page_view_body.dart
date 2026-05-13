import 'package:flutter/material.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/features/onboarding/data/onboarding_model.dart';

class PageViewBody extends StatelessWidget {
  const PageViewBody({
    super.key,
    required this.controller,
    required this.onBoardingModel,
  });

  final PageController controller;
  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSizedBox(height: 32),
        Container(
          height: 290,
          width: 345,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(onBoardingModel.image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const CustomSizedBox(height: 16),
        Text(
          onBoardingModel.title,
          textAlign: TextAlign.center,
          style: AppTextStyles.montserratExtraBold24w800.copyWith(
            fontWeight: FontWeight.w700,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const CustomSizedBox(height: 10),
        Text(
          onBoardingModel.subTitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.montserratSemiBold14w600.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: AppColors.textDarkGray,
          ),
        ),
      ],
    );
  }
}
