import 'package:ecommerce/features/wishlist/data/models/wishlist_response.dart';

abstract class WishlistRemoteDataSource {
  Future<WishlistResponse> getWishlist();
  Future<void> addProductToWishList(String productId);
  Future<void> removeProductFromWishlist(String productId);
}
