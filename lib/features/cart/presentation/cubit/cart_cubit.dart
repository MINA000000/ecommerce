import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/add_product.dart';
import 'package:ecommerce/features/cart/domain/use_cases/delete_product.dart';
import 'package:ecommerce/features/cart/domain/use_cases/get_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/update_product.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CartCubit extends Cubit<CartState> {
  CartCubit(
    this._addProduct,
    this._deleteProduct,
    this._getCart,
    this._updateProduct,
  ) : super(CartInitial());
  final GetCart _getCart;
  final UpdateProduct _updateProduct;
  final DeleteProduct _deleteProduct;
  final AddProduct _addProduct;
  late Cart cart;
  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await _getCart();
    result.fold((failure) => emit(GetCartError(failure.message)), (cartEntity) {
      cart = cartEntity;
      emit(GetCartSuccess());
    });
  }

  Future<void> updateProduct(String productId, int quantity) async {
    emit(UpdateProductLoading());
    final result = await _updateProduct(productId, quantity);
    result.fold((failure) => emit(UpdateProductError(failure.message)), (
      cartEntity,
    ) {
      cart = cartEntity;
      emit(UpdateProductSuccess());
    });
  }

  Future<void> addProduct(String productId) async {
    emit(AddProductLoading());
    final result = await _addProduct(productId);
    result.fold((failure) => emit(AddProductError(failure.message)), (_) {
      emit(AddProductSuccess());
    });
  }

  Future<void> deleteProduct(String productId) async {
    emit(DeleteProductLoading());
    final result = await _deleteProduct(productId);
    result.fold((failure) => emit(DeleteProductError(failure.message)), (
      cartEntity,
    ) {
      cart = cartEntity;
      emit(DeleteProductSuccess());
    });
  }
}
