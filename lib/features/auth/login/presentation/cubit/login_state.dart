class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  // For security reasons, I'm not putting a LoginModel here because it contains the token
  // and we don't need token in the UI layer, we only need it in the data layer to save it in the secure storage and use it in the API calls.
}

class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}
