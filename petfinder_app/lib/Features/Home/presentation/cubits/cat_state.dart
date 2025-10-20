part of 'cat_cubit.dart';

abstract class CatState {}

class CatInitial extends CatState {}

class CatLoading extends CatState {}

class CatSuccess extends CatState {
  final List<CatModel> cats;
  CatSuccess(this.cats);
}

class CatError extends CatState {
  final String message;
  CatError(this.message);
}
