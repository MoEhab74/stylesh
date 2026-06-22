import 'package:stylesh/features/home/data/models/product_model.dart';

sealed class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;
  ProductsLoaded({required this.products});
}

class ProductsError extends ProductsState {
  final String message;
  ProductsError({required this.message});
}
