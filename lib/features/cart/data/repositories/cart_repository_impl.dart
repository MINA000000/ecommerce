import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/mappers/cart_mappers.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _remoteDataSource;
  CartRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, void>> addProductToCart(String productId) async {
    try {
      await _remoteDataSource.addProductToCart(productId);
      return Right(null);
    } on RemoteException catch (exceptoin) {
      return Left(Failure(exceptoin.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> deleteProductFromCart(String productId) async {
    try {
      final response = await _remoteDataSource.deleteProductFromCart(productId);
      return Right(response.cartModel.toEntity);
    } on RemoteException catch (exceptoin) {
      return Left(Failure(exceptoin.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> getCart() async {
    try {
      final response = await _remoteDataSource.getCart();
      return Right(response.cartModel.toEntity);
    } on RemoteException catch (exceptoin) {
      return Left(Failure(exceptoin.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> updateProductFromCart(
    String productId,
    int quantity,
  ) async {
    try {
      final response = await _remoteDataSource.updateProductFromCart(
        productId,
        quantity,
      );
      return Right(response.cartModel.toEntity);
    } on RemoteException catch (exceptoin) {
      return Left(Failure(exceptoin.message));
    }
  }
}
