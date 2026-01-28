import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/entities/product.dart';
import 'package:ecommerce/core/error/failure.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts({String? categoryId});
}
