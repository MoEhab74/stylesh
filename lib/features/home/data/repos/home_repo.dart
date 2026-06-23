import 'package:dartz/dartz.dart';
import 'package:stylesh/core/errors/error_model.dart';
import 'package:stylesh/features/home/data/models/product_model.dart';
import 'package:stylesh/features/home/data/models/category_model.dart';

abstract class HomeRepo {
  Future<Either<ErrorModel, List<ProductModel>>> getProducts({
    required int limit,
    required int offset,
  });
  Future<Either<ErrorModel, List<CategoryModel>>> getCategories();
  Future<Either<ErrorModel, List<ProductModel>>> getProductsByCategory({
    required String categoryId,
  });
}
