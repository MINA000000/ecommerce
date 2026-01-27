import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/entities/product.dart';
import 'package:ecommerce/core/error/failure.dart';

abstract class WishlistRepository {
  Future<Either<Failure,List<Product>>> getWishlist();
  Future<Either<Failure,void>> addProductToWishList(String productId);
  Future<Either<Failure,void>> removeProductFromWishlist(String productId);
}