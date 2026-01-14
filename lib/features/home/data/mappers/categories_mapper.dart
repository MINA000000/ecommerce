import 'package:ecommerce/features/home/data/models/category_model.dart';
import 'package:ecommerce/features/home/demain/entities/category.dart';

extension CategoryMapper on CategoryModel {
  Category get toEntity => Category(id: id, imageURL: imageURL, name: name);
}
