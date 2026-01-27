import 'package:ecommerce/core/entities/product.dart';

abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class GetWishlistLoading extends WishlistState {}

class GetWishlistSuccess extends WishlistState {
  final List<Product> products;
  GetWishlistSuccess(this.products);
}

class GetWishlistError extends WishlistState {
  final String message;
  GetWishlistError(this.message);
}

class AddProductToWishlistLoading extends WishlistState {}

class AddProductToWishlistSuccess extends WishlistState {}

class AddProductToWishlistError extends WishlistState {
  final String message;
  AddProductToWishlistError(this.message);
}

class RemoveProductFromWishlistLoading extends WishlistState {}

class RemoveProductFromWishlistSuccess extends WishlistState {}

class RemoveProductFromWishlistError extends WishlistState {
  final String message;
  RemoveProductFromWishlistError(this.message);
}
