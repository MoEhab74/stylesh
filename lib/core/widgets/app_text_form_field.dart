import 'package:flutter/material.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.isPassword,
    this.toggleIconPressed,
    this.obscureText,
  });
  final String hintText;
  final Widget? prefixIcon;
  final bool isPassword;
  final void Function()? toggleIconPressed;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.montserratHintTextStyle,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIcon: Visibility(
          visible: isPassword,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          // Toggle the icon based on the obscureText value
          // I'll handle the toggle logic in the cubit
          child: IconButton(
            icon: obscureText == true
                ? const Icon(
                    Icons.visibility,
                    color: AppColors.iconColor,
                    size: 24,
                  )
                : Icon(
                    Icons.visibility_off,
                    color: AppColors.iconColor,
                    size: 24,
                  ),
            onPressed: toggleIconPressed,
          ),
        ),
      ),
    );
  }
}
