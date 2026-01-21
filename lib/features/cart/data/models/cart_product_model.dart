import 'package:ecommerce/core/models/brand_model.dart';

class CartProductModel {
  final String id;
  final String title;
  final String imageCover;
  final BrandModel brand;
  final double ratingsAverage;

  const CartProductModel({
    required this.id,
    required this.title,
    required this.imageCover,
    required this.brand,
    required this.ratingsAverage,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      imageCover: json['imageCover'] as String,
      brand: BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
    );
  }
}
