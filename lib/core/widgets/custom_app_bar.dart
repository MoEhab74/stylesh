import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/app_strings.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/features/home/presentation/widgets/app_bar_icon_widget.dart';
import 'package:stylesh/generated/assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Center(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.iconBg,
          ),
          child: AppBarIconWidget(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            hoverColor: Colors.transparent,
            icon: SvgPicture.asset(
              Assets.assetsIconsMenueIcon,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
      ),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.assetsImagesAppBarIcon, width: 32.w, height: 32.h),
          const CustomSizedBox(width: 8),
          Text(
            AppStrings.appName,
            style: AppTextStyles.montserratSemiBold18w600.copyWith(
              color: AppColors.accentBlue,
            ),
          ),
        ],
      ),
      actions: [
        AppBarIconWidget(
          icon: Image.asset(
            Assets.assetsImagesProfile,
            width: 40.w,
            height: 40.h,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
