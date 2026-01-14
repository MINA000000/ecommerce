import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/mappers/categories_mapper.dart';
import 'package:ecommerce/features/home/demain/entities/category.dart';
import 'package:ecommerce/features/home/demain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _dataSource;
  HomeRepositoryImpl(this._dataSource);
  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final response = await _dataSource.getCategories();
      final categories = response.data
          .map((categoryModel) => categoryModel.toEntity)
          .toList();
      return Right(categories);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
