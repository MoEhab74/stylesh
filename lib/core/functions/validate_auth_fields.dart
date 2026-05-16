String? Function(String?)? validateEmail(String? email) {
  return (email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    // Use REGEX to validate email format
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  };
}

String? Function(String?)? validatePassword(String? password) {
  return (password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  };
}

// It should take both password and confirm password as parameters to compare them
String? Function(String?)? validateConfirmPassword(String? password, String? confirmPassword) {
  return (confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm Password is required';
    }
    if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  };
}
