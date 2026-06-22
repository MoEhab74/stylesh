import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesh/core/utils/app_colors.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String iconPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24.sp,
            height: 24.sp,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.primaryColor : AppColors.blackColor,
              BlendMode.srcIn,
            ),
          ),
          2.verticalSpace,
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.primaryColor : AppColors.blackColor,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
