import 'dart:async';

import 'package:flutter_app2/data/api/prodcuts_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product.dart';
part 'state.dart';

class ProductCubit extends Cubit<ProductStates> {
  late StreamSubscription<List<Product>> _sub;

  ProductCubit() : super(ProductsLoading()) {
    _sub = ProductApi.getProducts().listen(
      (products) => emit(
        ProductsLoaded(products),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _sub.cancel();
    super.close();
  }
}
