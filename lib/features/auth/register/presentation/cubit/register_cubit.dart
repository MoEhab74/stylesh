import 'package:bloc/bloc.dart';
import 'package:stylesh/features/auth/register/data/repos/register_repo.dart';
import 'package:stylesh/features/auth/register/presentation/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;
  // When I providing the cubit to the register screen, I'll inject the repo from the DI
  RegisterCubit(this.registerRepo) : super(RegisterInitial());

  // Register method
  void register({
    required String name,
    required String email,
    required String password,
    required String avatarURL,
  }) async {
    emit(RegisterLoading());
    final result = await registerRepo.register(
      name: name,
      email: email,
      password: password,
      avatarURL: avatarURL,
    );
    result.fold(
      (error) => emit(RegisterFailure(error.message)),
      (user) => emit(RegisterSuccess(user)),
    );
  }
}
