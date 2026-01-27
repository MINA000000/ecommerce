import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/wishlist/domain/repositories/wishlist_repository.dart';

class AddProductToWishlist {
  final WishlistRepository _wishlistRepository;
  AddProductToWishlist(this._wishlistRepository);
  Future<Either<Failure, void>> call(String productId) async {
    final response = await _wishlistRepository.addProductToWishList(productId);
    return response;
  }
}
