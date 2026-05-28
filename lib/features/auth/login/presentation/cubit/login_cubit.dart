import 'package:bloc/bloc.dart';
import 'package:stylesh/features/auth/login/data/repos/login_repo.dart';
import 'package:stylesh/features/auth/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await loginRepo.logIn(
      email: email,
      password: password,
    );
    result.fold(
      (error) => emit(LoginFailure(error.message)),
      (user) => emit(LoginSuccess()),
    );
  }
}
