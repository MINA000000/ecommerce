import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/products/data/data_sources/remote/products_remote_data_source.dart';
import 'package:ecommerce/features/products/data/models/products_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRemoteDataSource)
class ProductsApiRemoteDataSource implements ProductsRemoteDataSource {
  final Dio _dio;
  ProductsApiRemoteDataSource(this._dio);
  @override
  Future<ProductsResponse> getProducts({String? categoryId}) async {
    try {
      final response = await _dio.get(
        APIConstants.productsEndpoint,
        queryParameters: {if (categoryId != null) 'category': categoryId},
      );
      return ProductsResponse.fromJson(response.data);
    } catch (exceptoin) {
      print(exceptoin);
      String? message;
      if (exceptoin is DioException) {
        message = exceptoin.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to get products');
    }
  }
}
