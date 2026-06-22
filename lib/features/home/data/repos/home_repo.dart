import 'package:dartz/dartz.dart';
import 'package:stylesh/core/errors/error_model.dart';
import 'package:stylesh/features/home/data/models/product_model.dart';
import 'package:stylesh/features/home/data/models/category_model.dart';

abstract class HomeRepo {
  Future<Either<ErrorModel, List<ProductModel>>> getProducts();
  Future<Either<ErrorModel, List<CategoryModel>>> getCategories();
}
