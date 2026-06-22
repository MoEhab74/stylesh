import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'banner_card.dart';
import '../../data/models/banner_model.dart';

class CustomBannerSlider extends StatefulWidget {
  final List<BannerModel> banners;

  const CustomBannerSlider({super.key, required this.banners});

  @override
  State<CustomBannerSlider> createState() => _CustomBannerSliderState();
}

class _CustomBannerSliderState extends State<CustomBannerSlider> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.banners.length,
            padEnds: true,
            itemBuilder: (context, index) {
              final banner = widget.banners[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(),
                child: BannerCard(
                  discountText: banner.discountText,
                  productTitle: banner.productTitle,
                  subtitle: banner.subtitle,
                  imagePath: banner.imagePath,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        SmoothPageIndicator(
          controller: _pageController,
          count: widget.banners.length,
          effect: WormEffect(
            activeDotColor: Colors.pink.shade300,
            dotColor: Colors.grey.shade400,
            dotHeight: 8.h,
            dotWidth: 8.w,
            spacing: 4.w,
          ),
        ),
      ],
    );
  }
}
