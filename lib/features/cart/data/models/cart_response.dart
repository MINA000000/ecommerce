import 'cart_model.dart';

class CartResponse {
  final String status;
  final int numOfCartItems;
  final String? cartId;
  final CartModel cartModel;

  const CartResponse({
    required this.status,
    required this.numOfCartItems,
    required this.cartId,
    required this.cartModel,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
    status: json['status'] as String,
    numOfCartItems: json['numOfCartItems'] as int,
    cartId: json['cartId'] as String?,
    cartModel: CartModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}
