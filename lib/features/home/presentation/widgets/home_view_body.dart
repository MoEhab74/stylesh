import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/core/widgets/app_search_field.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/features/home/data/models/banner_model.dart';
import 'package:stylesh/features/home/presentation/widgets/categories_list_view.dart';
import 'package:stylesh/features/home/presentation/widgets/custom_banner_slider.dart';
import 'package:stylesh/features/home/presentation/widgets/deal_of_the_day_section.dart';
import 'package:stylesh/features/home/presentation/widgets/products_action_widget.dart';
import 'package:stylesh/features/home/presentation/widgets/products_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    log("HomeViewBody build method called");
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomSizedBox(height: 16),
          // Search TextField
          const AppSearchField(),
          // AllFeatures text Sort And Filter buttoms
          const CustomSizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  "All Features",
                  style: AppTextStyles.montserratSemiBold14w600.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
                const Spacer(),
                ProductsActionWidget(
                  text: "Sort",
                  icon: Icon(
                    Icons.sort,
                    size: 16.sp,
                    color: AppColors.blackColor,
                  ),
                ),
                const CustomSizedBox(width: 8),
                ProductsActionWidget(
                  text: "Filter",
                  icon: Icon(
                    Icons.filter_list,
                    size: 16.sp,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ),

          const CustomSizedBox(height: 16),
          // Categories ListView
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: CategoriesListView(),
          ),
          const CustomSizedBox(height: 16),
          // Banner Slider
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomBannerSlider(banners: banners),
          ),
          // Deal of the Day Container
          const DealOfTheDaySection(
            backgroundColor: AppColors.accentBlue,
            dealTitle: "Deal of the Day",
            dealSubtitle: "22h 55m 20s remaining",
            dealIcon: Icons.alarm_outlined,
          ),
          // Products ListView
          const ProductHorizontalListSection(),

          // Speacial Offers Container
        ],
      ),
    );
  }
}
