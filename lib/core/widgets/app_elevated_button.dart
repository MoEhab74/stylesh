import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    required this.buttonText,
  });
  final void Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 55.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      ),
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
