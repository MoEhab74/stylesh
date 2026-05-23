import 'package:flutter/material.dart';
import 'package:stylesh/core/utils/app_strings.dart';
import 'package:stylesh/core/utils/text_styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
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
    );
  }
}
