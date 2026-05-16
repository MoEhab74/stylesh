class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String errorMessage;

  ForgetPasswordFailure(this.errorMessage);
}

class PasswordVisibilityState extends ForgetPasswordState {
  final bool isPasswordVisible;

  PasswordVisibilityState(this.isPasswordVisible);
}
