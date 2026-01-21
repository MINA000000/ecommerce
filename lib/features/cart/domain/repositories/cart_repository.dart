import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> getCart();
  Future<Either<Failure, void>> addProductToCart(String productId);
  Future<Either<Failure, Cart>> updateProductFromCart(String productId,int quantity);
  Future<Either<Failure, Cart>> deleteProductFromCart(String productId);
}
