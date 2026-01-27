import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/wishlist/data/data_sources/remote/wishlist_remote_data_source.dart';
import 'package:ecommerce/features/wishlist/data/models/wishlist_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WishlistRemoteDataSource)
class WishlistAPIRemoteDataSource extends WishlistRemoteDataSource {
  final Dio _dio;
  WishlistAPIRemoteDataSource(this._dio);
  @override
  Future<WishlistResponse> getWishlist() async {
    try {
      final response = await _dio.get(APIConstants.wishlistEndpiont);
      return WishlistResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to get wishlist');
    }
  }

  @override
  Future<void> addProductToWishList(String productId) async {
    try {
      await _dio.post(
        APIConstants.wishlistEndpiont,
        data: {"productId": productId},
      );
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to get add product');
    }
  }

  @override
  Future<void> removeProductFromWishlist(String productId) async {
    try {
      await _dio.delete('${APIConstants.wishlistEndpiont}/$productId');
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to get add product');
    }
  }
}
