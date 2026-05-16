import 'package:flutter/material.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.isPassword,
    this.validator,
    this.controller,
  });

  final String hintText;
  final Widget? prefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? !isPasswordVisible : false,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.montserratHintTextStyle,
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
            child: widget.prefixIcon,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: Icon(
                  isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
      ),
    );
  }
}
