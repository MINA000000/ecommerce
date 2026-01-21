abstract class CartState {}

class CartInitial extends CartState {}

class GetCartLoading extends CartState {}

class GetCartSuccess extends CartState {}

class GetCartError extends CartState {
  final String message;
  GetCartError(this.message);
}

class AddProductLoading extends CartState {}

class AddProductSuccess extends CartState {}

class AddProductError extends CartState {
  final String message;
  AddProductError(this.message);
}

class UpdateProductLoading extends CartState {}

class UpdateProductSuccess extends CartState {}

class UpdateProductError extends CartState {
  final String message;
  UpdateProductError(this.message);
}

class DeleteProductLoading extends CartState {}

class DeleteProductSuccess extends CartState {}

class DeleteProductError extends CartState {
  final String message;
  DeleteProductError(this.message);
}
