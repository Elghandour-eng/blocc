part of 'cubit.dart';

abstract class ProductStates {}

class ProductsLoading extends ProductStates {}

class ProductsLoaded extends ProductStates {
  final List<Product> products;

  ProductsLoaded(this.products);
}

class ProductsError extends ProductStates {
  final String msg;

  ProductsError(this.msg);
}
