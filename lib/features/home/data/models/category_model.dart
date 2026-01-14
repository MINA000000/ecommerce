import 'package:ecommerce/features/home/demain/entities/category.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.imageURL,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String slug;
  final String imageURL;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["_id"],
      name: json["name"],
      slug: json["slug"],
      imageURL: json["image"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? "")!,
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? "")!,
    );
  }
}
