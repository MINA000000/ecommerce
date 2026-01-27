import 'package:ecommerce/core/models/product_model.dart';


class WishlistResponse {
  final String status;
  final int count;
  final List<ProductModel> products;

  const WishlistResponse({
    required this.status,
    required this.count,
    required this.products,
  });

  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    return WishlistResponse(
      status: json['status'] as String,
      count: json['count'] as int,
      products: (json['data'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
