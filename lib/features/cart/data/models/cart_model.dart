import 'cart_item_model.dart';

class CartModel {
  final String? id;
  final String? cartOwner;
  final List<CartItemModel> productItems;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int totalCartPrice;

  const CartModel({
    required this.id,
    required this.cartOwner,
    required this.productItems,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.totalCartPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json['_id'] as String?,
    cartOwner: json['cartOwner'] as String?,
    productItems: (json['products'] as List<dynamic>)
        .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as int?,
    totalCartPrice: json['totalCartPrice'] as int,
  );
}
