import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylesh/features/home/data/models/product_model.dart';
import 'package:stylesh/features/home/data/repos/home_repo.dart';
import 'package:stylesh/features/home/presentation/cubit/Products_cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final HomeRepo homeRepo;
  ProductsCubit({required this.homeRepo}) : super(ProductsInitial());
  static const int _limit = 10;

  int _skip = 0;
  List<ProductModel> _products = [];
  bool _hasMore = true;
  bool _isFetching = false;

  Future<void> getProducts() async {
    _skip = 0;
    _products = [];
    _hasMore = true;

    emit(ProductsLoading());
    await _fetchProducts();
  }

  Future<void> getMoreProducts() async {
    if (!_hasMore || _isFetching) return;

    emit(ProductsPaginationLoading(products: _products));
    await _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    _isFetching = true;

    final response = await homeRepo.getProducts(
      offset: _skip,
      limit: _limit,
    );

    response.fold(
      (error) {
        if (_products.isEmpty) {
          emit(ProductsError(message: error.message));
        } else {
          emit(ProductsPaginationError(
            products: _products,
            message: error.message,
          ));
        }
      },
      (newProducts) {
        _products = [..._products, ...newProducts];
        _skip += newProducts.length;
        _hasMore = newProducts.length == _limit;

        emit(ProductsLoaded(products: _products, hasMore: _hasMore));
      },
    );

    _isFetching = false;
  }

  Future<void> getProductsByCategory({required String categoryId}) async {
    emit(ProductsLoading());
    final response = await homeRepo.getProductsByCategory(categoryId: categoryId);
    response.fold(
      (error) => emit(ProductsError(message: error.message)),
      (products) => emit(ProductsLoaded(products: products)),
    );
  }
}