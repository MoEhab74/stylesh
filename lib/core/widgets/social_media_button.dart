import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.socialMediaIcon,
    this.onPressed,
  });
  final Widget socialMediaIcon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withAlpha(20),
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryColor, // Set your border color here
          width: 1.0.w,
        ),
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Align(alignment: Alignment.center, child: socialMediaIcon),
      ),
    );
  }
}
