import 'package:flutter/material.dart';
import 'package:stylesh/core/utils/text_styles.dart';

class AuthScreenTitle extends StatelessWidget {
  const AuthScreenTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome \nBack!',
      style: AppTextStyles.montserratExtraBold36w700,
      textAlign: TextAlign.left,
    );
  }
}
