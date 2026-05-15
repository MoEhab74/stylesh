import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/text_styles.dart';

class AuthSuggestionWidget extends StatelessWidget {
  const AuthSuggestionWidget({
    super.key,
    required this.suggestionText,
    required this.actionText,
    this.onActionPressed, this.padding,
  });
  final String suggestionText;
  final String actionText;
  final void Function()? onActionPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(suggestionText, style: AppTextStyles.montserratMedium12w500),
            TextButton(
              onPressed: onActionPressed,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(50.w, 32.h),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(actionText),
            ),
          ],
        ),
      ),
    );
  }
}
