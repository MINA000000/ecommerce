import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/home/demain/entities/category.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Category>>> getCategories();
}
