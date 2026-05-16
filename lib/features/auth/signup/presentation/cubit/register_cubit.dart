import 'package:bloc/bloc.dart';
import 'package:stylesh/features/auth/signup/presentation/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  String? usernameOrEmail;
  String? password;


  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityState(isPasswordVisible));
  }
}
