import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stylesh/core/functions/validate_auth_fields.dart';
import 'package:stylesh/core/utils/app_strings.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/core/widgets/app_elevated_button.dart';
import 'package:stylesh/core/widgets/app_text_form_field.dart';
import 'package:stylesh/core/widgets/auth_suggestion_widget.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/core/widgets/social_media_button.dart';
import 'package:stylesh/features/auth/signup/presentation/cubit/register_cubit.dart';
import 'package:stylesh/features/auth/signup/presentation/cubit/register_state.dart';
import 'package:stylesh/generated/assets.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final TextEditingController emailOrUsernameController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    // Initialize controllers
    emailOrUsernameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailOrUsernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          // Handle successful registration, e.g., navigate to the home screen
        } else if (state is RegisterFailure) {
          // Handle registration failure, e.g., show an error message
        } else if (state is RegisterLoading) {
          // Handle loading state, e.g., show a loading indicator
        }
      },
      builder: (context, state) {
        return Form(
          key: registerFormKey,
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
              const CustomSizedBox(height: 32),
              AppTextFormField(
                controller: confirmPasswordController,
                validator: validateConfirmPassword(
                  passwordController.text.trim(),
                  confirmPasswordController.text.trim(),
                ),
                hintText: AppStrings.confirmPassword,
                prefixIcon: SvgPicture.asset(Assets.assetsIconsLock),
                isPassword: true,
              ),
              const CustomSizedBox(height: 16),
              // Terms and conditions text
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: AppStrings.byClickingThe,
                      style: AppTextStyles.montserratRegular14w400,
                    ),
                    TextSpan(
                      text: AppStrings.signUpButtonText,
                      style: AppTextStyles.montserratMedium12w500.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: AppStrings.agreeToPublicOffer,
                      style: AppTextStyles.montserratRegular14w400,
                    ),
                  ],
                ),
              ),
              const CustomSizedBox(height: 52),
              AppElevatedButton(
                onPressed: () {
                  if (registerFormKey.currentState!.validate()) {
                    // I'll handle the actual registration logic later
                  }
                },
                buttonText: AppStrings.signUp,
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
                suggestionText: AppStrings.alreadyHaveAnAccount,
                actionText: AppStrings.login,
                onActionPressed: () {
                  GoRouter.of(context).pop();
                },
                padding: const EdgeInsets.only(bottom: 8.0),
              ),
            ],
          ),
        );
      },
    );
  }
}
