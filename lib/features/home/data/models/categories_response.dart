import 'package:ecommerce/core/models/category_model.dart';
import 'package:ecommerce/core/models/meta_data.dart';

class CategoriesResponse {
  CategoriesResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  final int results;
  final Metadata metadata;
  final List<CategoryModel> data;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      results: json["results"],
      metadata: Metadata.fromJson(json["metadata"]),
      data: List<CategoryModel>.from(
        json["data"]!.map((x) => CategoryModel.fromJson(x)),
      ),
    );
  }
}
