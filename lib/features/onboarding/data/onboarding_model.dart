import 'package:stylesh/core/utils/app_strings.dart';
import 'package:stylesh/generated/assets.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    image: Assets.assetsImagesOnboarding1,
    title: AppStrings.onboardingTitle1,
    subTitle: AppStrings.onboardingSubTitle,
  ),
  OnBoardingModel(
    image: Assets.assetsImagesOnboarding3,
    title: AppStrings.onboardingTitle2,
    subTitle: AppStrings.onboardingSubTitle,
  ),
  OnBoardingModel(
    image: Assets.assetsImagesOnboarding2,
    title: AppStrings.onboardingTitle3,
    subTitle: AppStrings.onboardingSubTitle,
  ),
];
