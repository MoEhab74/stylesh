import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stylesh/core/routing/app_routes.dart';
import 'package:stylesh/core/utils/app_strings.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/core/widgets/app_elevated_button.dart';
import 'package:stylesh/core/widgets/app_text_form_field.dart';
import 'package:stylesh/core/widgets/auth_suggestion_widget.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/core/widgets/social_media_button.dart';
import 'package:stylesh/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:stylesh/features/auth/login/presentation/cubit/login_state.dart';
import 'package:stylesh/core/functions/validate_auth_fields.dart';
import 'package:stylesh/generated/assets.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late final TextEditingController emailOrUsernameController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailOrUsernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailOrUsernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // Handle successful login, e.g., navigate to the home screen
        } else if (state is LoginFailure) {
          // Handle login failure, e.g., show an error message
        } else if (state is LoginLoading) {
          // Handle loading state, e.g., show a loading indicator
        }
      },
      builder: (context, state) {
        // LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context);
        return Form(
          key: loginFormKey,
          child: Column(
            children: [
              AppTextFormField(
                controller: emailOrUsernameController,
                validator: validateEmail(emailOrUsernameController.text.trim()),
                hintText: AppStrings.usernameOrEmail,
                prefixIcon: SvgPicture.asset(Assets.assetsIconsUser),
                isPassword: false,
              ),
              const CustomSizedBox(height: 32),
              AppTextFormField(
                controller: passwordController,
                validator: validatePassword(passwordController.text.trim()),
                hintText: AppStrings.password,
                prefixIcon: SvgPicture.asset(Assets.assetsIconsLock),
                isPassword: true,
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
                  child: const Text(AppStrings.forgotPassword),
                ),
              ),
              const CustomSizedBox(height: 52),
              AppElevatedButton(
                onPressed: () {
                  if (loginFormKey.currentState!.validate()) {
                    // I'll handle the actual login logic later
                  }
                },
                buttonText: AppStrings.login,
              ),
              const CustomSizedBox(height: 75),
              // Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      AppStrings.orContinueWith,
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
                suggestionText: AppStrings.dontHaveAnAccount,
                actionText: AppStrings.signUp,
                onActionPressed: () {
                  GoRouter.of(context).push(AppRoutes.register);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
