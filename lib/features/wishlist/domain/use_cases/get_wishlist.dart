import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/entities/product.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/wishlist/domain/repositories/wishlist_repository.dart';

class GetWishlist {
  final WishlistRepository _wishlistRepository;
  GetWishlist(this._wishlistRepository);
  Future<Either<Failure, List<Product>>> call() async {
    final response = await _wishlistRepository.getWishlist();
    return response;
  }
}
