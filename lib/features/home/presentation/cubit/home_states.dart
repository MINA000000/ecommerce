import 'package:ecommerce/features/home/demain/entities/category.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetCategoriesLoading extends HomeState {}

class GetCategoriesSuccess extends HomeState {
  final List<Category> categories;
  GetCategoriesSuccess(this.categories);
}

class GetCategoriesError extends HomeState {
  final String errorMessage;
  GetCategoriesError(this.errorMessage);
}
