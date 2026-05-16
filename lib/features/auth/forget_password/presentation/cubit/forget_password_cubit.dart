import 'package:bloc/bloc.dart';
import 'package:stylesh/features/auth/forget_password/presentation/cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  String? usernameOrEmail;
  String? password;


  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityState(isPasswordVisible));
  }
}
