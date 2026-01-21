import 'package:ecommerce/features/cart/data/models/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<void> addProductToCart(String productId);
  Future<CartResponse> getCart();
  Future<CartResponse> updateProductFromCart(String productId, int quantity);
  Future<CartResponse> deleteProductFromCart(String productId);
}
