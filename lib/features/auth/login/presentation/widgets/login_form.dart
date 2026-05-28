import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stylesh/core/functions/animated_snack_bar.dart';
import 'package:stylesh/core/routing/app_routes.dart';
import 'package:stylesh/core/utils/app_strings.dart';
import 'package:stylesh/core/widgets/app_elevated_button.dart';
import 'package:stylesh/core/widgets/app_text_form_field.dart';
import 'package:stylesh/core/widgets/auth_suggestion_widget.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:stylesh/features/auth/login/presentation/cubit/login_state.dart';
import 'package:stylesh/core/functions/validate_auth_fields.dart';
import 'package:stylesh/core/widgets/or_continue_with_divider.dart';
import 'package:stylesh/core/widgets/social_media_login_row.dart';
import 'package:stylesh/generated/assets.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
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
          showAnimatedSnackbar(
            context,
            message: 'Login successful',
            type: AnimatedSnackBarType.success,
          );

          Future.delayed(const Duration(seconds: 2), () {
            if (context.mounted) {
              context.pushReplacement(AppRoutes.home);
            }
          });
        } else if (state is LoginFailure) {
          showAnimatedSnackbar(
            context,
            message: 'Login failed',
            type: AnimatedSnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: loginFormKey,
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
              state is LoginLoading
                  ? const CircularProgressIndicator()
                  : AppElevatedButton(
                      onPressed: () {
                        if (loginFormKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).login(
                            email: emailOrUsernameController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      buttonText: AppStrings.login,
                    ),
              const CustomSizedBox(height: 75),
              // Divider
              const OrContinueWithDivider(),
              const CustomSizedBox(height: 32),
              // Social media buttons
              const SocialMediaLoginRow(),
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
