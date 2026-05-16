import 'package:stylesh/core/utils/app_strings.dart';

String? Function(String?)? validateEmail(String? email) {
  return (email) {
    if (email == null || email.isEmpty) {
      return AppStrings.emailIsRequired;
    }
    // Use REGEX to validate email format
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      return AppStrings.invalidEmailFormat;
    }
    return null;
  };
}

String? Function(String?)? validatePassword(String? password) {
  return (password) {
    if (password == null || password.isEmpty) {
      return AppStrings.passwordIsRequired;
    }
    if (password.length < 6) {
      return AppStrings.passwordMinLength;
    }
    return null;
  };
}

// It should take both password and confirm password as parameters to compare them
String? Function(String?)? validateConfirmPassword(
  String? password,
  String? confirmPassword,
) {
  return (confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return AppStrings.confirmPasswordIsRequired;
    }
    if (confirmPassword != password) {
      return AppStrings.passwordsDoNotMatch;
    }
    return null;
  };
}
