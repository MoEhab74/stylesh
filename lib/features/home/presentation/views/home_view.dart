import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/core/widgets/custom_app_bar.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/features/home/presentation/widgets/bottom_bar_item.dart';
import 'package:stylesh/features/home/presentation/widgets/home_view_body.dart';
import 'package:stylesh/features/home/presentation/widgets/search_view_body.dart';
import 'package:stylesh/features/home/presentation/widgets/settings_view_body.dart';
import 'package:stylesh/features/home/presentation/widgets/wishlist_view_body.dart';
import 'package:stylesh/generated/assets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  List<Widget> get pages => [
    const HomeViewBody(), // 0
    const WishlistViewBody(), // 1
    Center(
      child: Text(
        'Please browse products to see them here.',
        style: AppTextStyles.montserratSemiBold14w600.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    ), // 2
    const SearchViewBody(), // 3
    const SettingsViewBody(), // 4
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        floatingActionButton: CustomSizedBox(
          height: 56.h,
          width: 56.w,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 2; // Navigate to Shopping Cart
              });
            },
            backgroundColor: AppColors.whiteColor,
            elevation: 4,
            shape: const CircleBorder(),
            child: SvgPicture.asset(
              Assets.assetsIconsShoppingCart,
              width: 24.sp,
              height: 24.sp,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 2
                    ? AppColors.primaryColor
                    : AppColors.blackColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          height: 70.h,
          color: Colors.white,
          elevation: 8,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarItem(
                iconPath: Assets.assetsIconsHome,
                label: 'Home',
                isSelected: _selectedIndex == 0,
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),

              BottomBarItem(
                iconPath: Assets.assetsIconsHeart,
                label: 'Wishlist',
                isSelected: _selectedIndex == 1,
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),

              SizedBox(width: 60.w),

              BottomBarItem(
                iconPath: Assets.assetsIconsSearch,
                label: 'Search',
                isSelected: _selectedIndex == 3,
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
              ),
              BottomBarItem(
                iconPath: Assets.assetsIconsSettings,
                label: 'Settings',
                isSelected: _selectedIndex == 4,
                onTap: () {
                  setState(() {
                    _selectedIndex = 4;
                  });
                },
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.homeBg,
        appBar: _selectedIndex == 2 ? null : const CustomAppBar(),
        body: pages[_selectedIndex],
      ),
    );
  }
}
