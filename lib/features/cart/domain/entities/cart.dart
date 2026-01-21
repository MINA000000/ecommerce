import 'package:ecommerce/features/cart/domain/entities/cart_item_data.dart';

class Cart {
  final List<CartItemData> productItems;
  final int totalCartPrice;

  const Cart({required this.productItems, required this.totalCartPrice});
}
