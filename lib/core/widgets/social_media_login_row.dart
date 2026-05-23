import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/core/widgets/social_media_button.dart';
import 'package:stylesh/generated/assets.dart';

class SocialMediaLoginRow extends StatelessWidget {
  const SocialMediaLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaButton(
          socialMediaIcon: SvgPicture.asset(
            Assets.assetsIconsGoogle,
            width: 24,
            height: 24,
          ),
          onPressed: () {},
        ),
        const CustomSizedBox(width: 12),
        SocialMediaButton(
          socialMediaIcon: SvgPicture.asset(
            Assets.assetsIconsFacebook,
            width: 24,
            height: 24,
          ),
          onPressed: () {},
        ),
        const CustomSizedBox(width: 12),
        SocialMediaButton(
          socialMediaIcon: SvgPicture.asset(
            Assets.assetsIconsApple,
            width: 24,
            height: 24,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
