import 'package:stylesh/features/home/data/models/product_model.dart';

sealed class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;
  final bool? hasMore;
  ProductsLoaded({required this.products, this.hasMore});
}

class ProductsPaginationLoading extends ProductsState {
  final List<ProductModel> products;
  ProductsPaginationLoading({required this.products});
}

class ProductsError extends ProductsState {
  final String message;
  ProductsError({required this.message});
}

class ProductsPaginationError extends ProductsState {
  final List<ProductModel> products; 
  final String message;
  ProductsPaginationError({required this.products, required this.message});
}
