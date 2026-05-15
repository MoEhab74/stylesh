import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/core/widgets/app_text_form_field.dart';
import 'package:stylesh/core/widgets/auth_screen_title.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/generated/assets.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ).copyWith(top: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthScreenTitle(title: "Forget \nPassword?"),
                  const CustomSizedBox(height: 36),
                  AppTextFormField(
                    hintText: 'Enter Your Email Address',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        top: 16.0,
                        bottom: 16.0,
                      ),
                      child: CustomSizedBox(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset(Assets.assetsIconsUser),
                      ),
                    ),
                    isPassword: false,
                  ),
                  const CustomSizedBox(height: 32),
                  // Terms and conditions text
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '* ',
                        style: AppTextStyles.montserratMedium12w500.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                       Expanded(
                        child: Text(
                          'We will send you a message to set or reset your new password',
                          style: AppTextStyles.montserratRegular14w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
