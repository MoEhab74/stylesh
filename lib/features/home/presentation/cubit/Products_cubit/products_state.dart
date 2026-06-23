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
  // بيظهر لما المستخدم يوصل لآخر اللست
  // ونحن بنجيب المزيد في الخلفية
  final List<ProductModel> products; // ← الموجودين عندنا دلوقتي
  ProductsPaginationLoading({required this.products});
}

class ProductsError extends ProductsState {
  final String message;
  ProductsError({required this.message});
}

class ProductsPaginationError extends ProductsState {
  // error بس في المنتجات الجديدة — مش في الأولانية
  final List<ProductModel> products; // ← الموجودين ظاهرين
  final String message;
  ProductsPaginationError({required this.products, required this.message});
}

/*
class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;
  final bool hasMore;   // ← في منتجات تانية ولا لأ؟
  ProductsLoaded({required this.products, required this.hasMore});
}

class ProductsPaginationLoading extends ProductsState {
  // بيظهر لما المستخدم يوصل لآخر اللست
  // ونحن بنجيب المزيد في الخلفية
  final List<ProductModel> products; // ← الموجودين عندنا دلوقتي
  ProductsPaginationLoading({required this.products});
}

class ProductsError extends ProductsState {
  final String message;
  ProductsError({required this.message});
}

class ProductsPaginationError extends ProductsState {
  // error بس في المنتجات الجديدة — مش في الأولانية
  final List<ProductModel> products; // ← الموجودين ظاهرين
  final String message;
  ProductsPaginationError({required this.products, required this.message});
}
 */
