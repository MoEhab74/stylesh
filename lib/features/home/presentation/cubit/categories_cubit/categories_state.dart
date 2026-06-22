import 'package:stylesh/features/home/data/models/category_model.dart';

class CategoriesState {}
class CategoriesInitial extends CategoriesState {}
class CategoriesLoading extends CategoriesState {}
class CategoriesLoaded extends CategoriesState {
  final List<CategoryModel> categories;
  CategoriesLoaded({required this.categories});
}
class CategoriesError extends CategoriesState {
  final String message;
  CategoriesError({required this.message});
}