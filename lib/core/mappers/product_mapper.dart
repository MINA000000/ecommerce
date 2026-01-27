import 'package:ecommerce/core/models/product_model.dart';
import 'package:ecommerce/core/entities/product.dart';

extension ProductMapper on ProductModel {
  Product get toEntity => Product(
    sold: sold,
    imagesURLs: imagesURLs,
    ratingsQuantity: ratingsQuantity,
    id: id,
    title: title,
    slug: slug,
    description: description,
    quantity: quantity,
    price: price,
    priceAfterDiscount: priceAfterDiscount,
    imageCoverURL: imageCoverURL,
    ratingsAverage: ratingsAverage,
  );
}
