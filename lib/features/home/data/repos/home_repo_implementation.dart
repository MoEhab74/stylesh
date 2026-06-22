import 'package:dartz/dartz.dart';
import 'package:stylesh/core/api/api_consumer.dart';
import 'package:stylesh/core/api/api_endpoints.dart';
import 'package:stylesh/core/errors/error_model.dart';
import 'package:stylesh/features/home/data/models/product_model.dart';
import 'package:stylesh/features/home/data/models/category_model.dart';
import 'package:stylesh/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer apiConsumer;
  HomeRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ErrorModel, List<ProductModel>>> getProducts() async {
    try {
      final response = await apiConsumer.get(ApiEndpoints.products);
      List<ProductModel> products = [];
      for (var product in response) {
        products.add(ProductModel.fromJson(product));
      }
      return right(products);
    } on Exception catch (e) {
      return left(ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorModel, List<CategoryModel>>> getCategories() async {
    try {
      final response = await apiConsumer.get(ApiEndpoints.categories);
      List<CategoryModel> categories = [];
      for (var category in response) {
        categories.add(CategoryModel.fromJson(category));
      }
      return right(categories);
    } on Exception catch (e) {
      return left(ErrorModel(message: e.toString()));
    }
  }
}
