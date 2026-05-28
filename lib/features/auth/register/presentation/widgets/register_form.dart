import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stylesh/core/functions/animated_snack_bar.dart';
import 'package:stylesh/core/functions/validate_auth_fields.dart';
import 'package:stylesh/core/utils/app_strings.dart';
import 'package:stylesh/core/widgets/app_elevated_button.dart';
import 'package:stylesh/core/widgets/app_text_form_field.dart';
import 'package:stylesh/core/widgets/auth_suggestion_widget.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/core/widgets/or_continue_with_divider.dart';
import 'package:stylesh/core/widgets/social_media_login_row.dart';
import 'package:stylesh/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:stylesh/features/auth/register/presentation/cubit/register_state.dart';
import 'package:stylesh/features/auth/register/presentation/widgets/terms_and_conditions_text.dart';
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
          showAnimatedSnackbar(context, message: 'Registration successful');
          // Navigate to login screen after successful registration
          Future.delayed(const Duration(seconds: 2), () {
            if (context.mounted) {
              GoRouter.of(context).pop();
            }
          });
        } else if (state is RegisterFailure) {
          showAnimatedSnackbar(context, message: 'Registration failed');
        }
      },
      builder: (context, state) {
        return Form(
          key: registerFormKey,
          child: Column(
            children: [
              AppTextFormField(
                controller: emailOrUsernameController,
                validator: validateEmail,
                hintText: AppStrings.usernameOrEmail,
                prefixIcon: SvgPicture.asset(Assets.assetsIconsUser),
                isPassword: false,
              ),
              const CustomSizedBox(height: 32),
              AppTextFormField(
                controller: passwordController,
                validator: validatePassword,
                hintText: AppStrings.password,
                prefixIcon: SvgPicture.asset(Assets.assetsIconsLock),
                isPassword: true,
              ),
              const CustomSizedBox(height: 32),
              AppTextFormField(
                controller: confirmPasswordController,
                validator: (val) =>
                    validateConfirmPassword(passwordController.text, val),
                hintText: AppStrings.confirmPassword,
                prefixIcon: SvgPicture.asset(Assets.assetsIconsLock),
                isPassword: true,
              ),
              const CustomSizedBox(height: 16),
              // Terms and conditions text
              TermsAndConditionsText(),
              const CustomSizedBox(height: 52),
              state is RegisterLoading
                  ? const CircularProgressIndicator()
                  : AppElevatedButton(
                      onPressed: () {
                        if (registerFormKey.currentState!.validate()) {
                          // I'll handle the actual registration logic later
                          // Test the Register logic
                          context.read<RegisterCubit>().register(
                            name: 'Test User',
                            email: emailOrUsernameController.text.trim(),
                            password: passwordController.text.trim(),
                            avatarURL:
                                'https://learn.zoner.com/wp-content/uploads/2025/04/zoner-ai-image-creator.jpg',
                          );
                        }
                      },
                      buttonText: AppStrings.signUp,
                    ),
              const CustomSizedBox(height: 75),
              // Divider
              OrContinueWithDivider(),
              const CustomSizedBox(height: 32),
              // Social media buttons
              SocialMediaLoginRow(),
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
