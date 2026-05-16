import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesh/core/functions/validate_auth_fields.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/core/widgets/app_elevated_button.dart';
import 'package:stylesh/core/widgets/app_text_form_field.dart';
import 'package:stylesh/core/widgets/auth_screen_title.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:stylesh/features/auth/forget_password/presentation/cubit/forget_password_state.dart';
import 'package:stylesh/generated/assets.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          // Handle successful forget password, e.g., show a success message
        } else if (state is ForgetPasswordFailure) {
          // Handle forget password failure, e.g., show an error message
        } else if (state is ForgetPasswordLoading) {
          // Handle loading state, e.g., show a loading indicator
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthScreenTitle(title: "Forget \nPassword?"),
              const CustomSizedBox(height: 36),
              AppTextFormField(
                validator: validateEmail(_emailController.text.trim()),
                hintText: 'Enter Your Email Address',
                prefixIcon: SvgPicture.asset(Assets.assetsIconsUser),
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
              const CustomSizedBox(height: 36.0),
              AppElevatedButton(
                buttonText: 'Send',
                onPressed: () {
                  // I'll handle the actual forget password logic later
                  if (_formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
