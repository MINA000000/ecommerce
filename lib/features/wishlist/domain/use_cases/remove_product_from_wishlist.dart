import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class RemoveProductFromWishlist {
  final WishlistRepository _wishlistRepository;
  RemoveProductFromWishlist(this._wishlistRepository);
  Future<Either<Failure, void>> call(String productId) async {
    final response = await _wishlistRepository.removeProductFromWishlist(productId);
    return response;
  }
}
