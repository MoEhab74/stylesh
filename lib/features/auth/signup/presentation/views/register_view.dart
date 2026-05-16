import 'package:flutter/material.dart';
import 'package:stylesh/core/utils/app_strings.dart';
import 'package:stylesh/core/widgets/auth_screen_title.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/features/auth/signup/presentation/widgets/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthScreenTitle(title: AppStrings.createAnAccount),
                  CustomSizedBox(height: 36),
                  RegisterForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
