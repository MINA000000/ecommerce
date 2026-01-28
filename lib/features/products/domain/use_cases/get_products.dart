import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/entities/product.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/products/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProducts {
  final ProductsRepository _productsRepository;
  GetProducts(this._productsRepository);
  Future<Either<Failure, List<Product>>> call({String? categoryId}) async {
    final result = await _productsRepository.getProducts(
      categoryId: categoryId,
    );
    return result;
  }
}
