class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.imageURL,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String name;
  final String slug;
  final String imageURL;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["_id"],
      name: json["name"],
      slug: json["slug"],
      imageURL: json["image"],
      createdAt: json["createdAt"] == null
          ? null
          : DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: json["updatedAt"] == null
          ? null
          : DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }
}
