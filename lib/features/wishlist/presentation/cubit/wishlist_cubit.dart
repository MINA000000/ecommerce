import 'package:ecommerce/features/wishlist/domain/use_cases/add_product_to_wishlist.dart';
import 'package:ecommerce/features/wishlist/domain/use_cases/get_wishlist.dart';
import 'package:ecommerce/features/wishlist/domain/use_cases/remove_product_from_wishlist.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(
    this._addProductToWishlist,
    this._getWishlist,
    this._removeProductFromWishlist,
  ) : super(WishlistInitial());

  final GetWishlist _getWishlist;
  final AddProductToWishlist _addProductToWishlist;
  final RemoveProductFromWishlist _removeProductFromWishlist;

  Future<void> getWishlist() async {
    emit(GetWishlistLoading());
    final result = await _getWishlist();
    result.fold(
      (failure) => emit(GetWishlistError(failure.message)),
      (products) => emit(GetWishlistSuccess(products)),
    );
  }

  Future<void> addProductToWishlist(String proudctId) async {
    emit(AddProductToWishlistLoading());
    final result = await _addProductToWishlist(proudctId);
    result.fold(
      (failure) => emit(AddProductToWishlistError(failure.message)),
      (_) => emit(AddProductToWishlistSuccess()),
    );
  }

  Future<void> removeProductFromWishlist(String productId) async {
    emit(RemoveProductFromWishlistLoading());
    final result = await _removeProductFromWishlist(productId);
    result.fold(
      (failure) => emit(RemoveProductFromWishlistError(failure.message)),
      (_) => emit(RemoveProductFromWishlistSuccess()),
    );
  }
}
