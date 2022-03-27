import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app2/data/models/product.dart';

class ProductApi {
  const ProductApi();

  static Stream<List<Product>> getProducts() {
    final ref = FirebaseFirestore.instance.collection("Products");
    return ref.snapshots().map(
      (event) {
        final products = <Product>[];
        for (final doc in event.docs) {
          final product = Product.fromMap(doc.data());
          products.add(product.copyWith(id: doc.id));
        }
        return products;
      },
    );
  }
}
