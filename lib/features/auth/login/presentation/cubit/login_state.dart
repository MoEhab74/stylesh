class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}

class PasswordVisibilityState extends LoginState {
  final bool isPasswordVisible;

  PasswordVisibilityState(this.isPasswordVisible);
}
