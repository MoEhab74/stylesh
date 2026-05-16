class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String errorMessage;

  RegisterFailure(this.errorMessage);
}

class PasswordVisibilityState extends RegisterState {
  final bool isPasswordVisible;

  PasswordVisibilityState(this.isPasswordVisible);
}
