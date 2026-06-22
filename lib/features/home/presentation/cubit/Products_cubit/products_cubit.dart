import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylesh/features/home/data/repos/home_repo.dart';
import 'package:stylesh/features/home/presentation/cubit/Products_cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final HomeRepo homeRepo;
  ProductsCubit({required this.homeRepo}) : super(ProductsInitial());
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final response = await homeRepo.getProducts();
    response.fold(
      (error) => emit(ProductsError(message: error.message)),
      (products) => emit(ProductsLoaded(products: products)),
    );
  }
}