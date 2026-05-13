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
    title: 'Choose Products',
    subTitle:
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
  ),
  OnBoardingModel(
    image: Assets.assetsImagesOnboarding3,
    title: 'Make Payment',
    subTitle:
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
  ),
  OnBoardingModel(
    image: Assets.assetsImagesOnboarding2,
    title: 'Get Your Order',
    subTitle:
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
  ),
];
