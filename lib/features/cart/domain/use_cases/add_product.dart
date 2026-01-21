import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddProduct {
  final CartRepository _cartRepository;
  AddProduct(this._cartRepository);

  Future<Either<Failure, void>> call(String productId) async {
    return _cartRepository.addProductToCart(productId);
  }
}
