import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylesh/features/home/data/repos/home_repo.dart';
import 'package:stylesh/features/home/presentation/cubit/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo homeRepo;
  CategoriesCubit({required this.homeRepo})
    : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    final response = await homeRepo.getCategories();
    response.fold(
      (error) => emit(CategoriesError(message: error.message)),
      (categories) => emit(CategoriesLoaded(categories: categories)),
    );
  }
  
}