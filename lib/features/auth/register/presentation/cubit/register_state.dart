import 'package:stylesh/features/auth/register/data/models/user_model.dart';

class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final UserModel user;

  RegisterSuccess(this.user);
}

class RegisterFailure extends RegisterState {
  final String errorMessage;

  RegisterFailure(this.errorMessage);
}

class PasswordVisibilityState extends RegisterState {
  final bool isPasswordVisible;

  PasswordVisibilityState(this.isPasswordVisible);
}
