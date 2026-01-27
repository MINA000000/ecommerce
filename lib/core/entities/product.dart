class Product {
  final double? sold;
  final List<String> imagesURLs;
  final int ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final int? priceAfterDiscount;
  final String imageCoverURL;
  final double ratingsAverage;

  const Product({
    required this.sold,
    required this.imagesURLs,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.priceAfterDiscount,
    required this.imageCoverURL,
    required this.ratingsAverage,
  });
}
