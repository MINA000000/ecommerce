import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/entities/product.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/core/mappers/product_mapper.dart';
import 'package:ecommerce/features/wishlist/data/data_sources/remote/wishlist_remote_data_source.dart';
import 'package:ecommerce/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WishlistRepository)
class WishlistRepositoryImpl extends WishlistRepository {
  final WishlistRemoteDataSource _wishlistRemoteDataSource;
  WishlistRepositoryImpl(this._wishlistRemoteDataSource);
  @override
  Future<Either<Failure, List<Product>>> getWishlist() async {
    try {
      final response = await _wishlistRemoteDataSource.getWishlist();
      final products = response.products
          .map((productModel) => productModel.toEntity)
          .toList();
      return Right(products);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> addProductToWishList(String productId) async {
    try {
      await _wishlistRemoteDataSource.addProductToWishList(productId);
      return Right(null);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> removeProductFromWishlist(
    String productId,
  ) async {
    try {
      await _wishlistRemoteDataSource.removeProductFromWishlist(productId);
      return Right(null);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
