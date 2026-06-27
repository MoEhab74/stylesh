import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductPageViewBuilder extends StatefulWidget {
  const ProductPageViewBuilder({super.key, required this.imageList});
  final List<String> imageList;

  @override
  State<ProductPageViewBuilder> createState() => _ProductPageViewBuilderState();
}

class _ProductPageViewBuilderState extends State<ProductPageViewBuilder> {
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
          height: 300.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imageList.length,
            padEnds: true,
            itemBuilder: (context, index) {
              final image = widget.imageList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(),
                // Here should be the Image returned from the API
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        SmoothPageIndicator(
          controller: _pageController,
          count: widget.imageList.length,
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
