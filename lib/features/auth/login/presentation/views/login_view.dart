import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stylesh/core/routing/app_routes.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/core/widgets/app_elevated_button.dart';
import 'package:stylesh/core/widgets/app_text_form_field.dart';
import 'package:stylesh/core/widgets/auth_screen_title.dart';
import 'package:stylesh/core/widgets/auth_suggestion_widget.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/core/widgets/social_media_button.dart';
import 'package:stylesh/generated/assets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  const AuthScreenTitle(
                    title: "Welcome \nBack!",
                  ),
                  const CustomSizedBox(height: 36),
                  AppTextFormField(
                    hintText: 'Username or Email',
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
                  AppTextFormField(
                    hintText: 'Password',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        top: 16.0,
                        bottom: 16.0,
                        right: 1.0,
                      ),
                      child: CustomSizedBox(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset(Assets.assetsIconsLock),
                      ),
                    ),
                    isPassword: true,
                    toggleIconPressed: () {},
                    obscureText: true,
                  ),
                  const CustomSizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(110.w, 32.h),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        GoRouter.of(context).push(AppRoutes.forgetPassword);
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  const CustomSizedBox(height: 52),
                  AppElevatedButton(onPressed: () {}, buttonText: 'Login'),
                  const CustomSizedBox(height: 75),
                  // Divider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'OR Continue with',
                          style: AppTextStyles.montserratMedium12w500,
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const CustomSizedBox(height: 32),
                  // Social media buttons
                  Row(
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
                      CustomSizedBox(width: 12),
                      SocialMediaButton(
                        socialMediaIcon: SvgPicture.asset(
                          Assets.assetsIconsFacebook,
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {},
                      ),
                      CustomSizedBox(width: 12),
                      SocialMediaButton(
                        socialMediaIcon: SvgPicture.asset(
                          Assets.assetsIconsApple,
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const CustomSizedBox(height: 28),
                  //  Sign up suggestion
                  AuthSuggestionWidget(
                    suggestionText: 'Don\'t have an account? ',
                    actionText: 'Sign Up',
                    onActionPressed: () {
                      GoRouter.of(context).push(AppRoutes.register);
                    },
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
