
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app2/data/models/product.dart';

class ProductApi
{
List<Product> products=[];
List<Product> update=[];
ProductApi(this.products);

fetchfrist()async
{

   await  FirebaseFirestore.instance.collection('Products').get().
   then((value) {
value.docs.forEach((element) {
  Product p =Product.fromJson(element.data());
  p.id=element.id;
  products.add(p);
});

  } );
   return products;
}


  getProducts()async
  {

return  await

FirebaseFirestore.instance.collection("Products").snapshots().forEach((element) {
      element.docs.forEach((element) {
        Product p =Product.fromJson(element.data());
        p.id=element.id;
        products.add(p);
        print(products.length);


      });
    });


//    await  FirebaseFirestore.instance.collection('Products').get().
//    then((value) {
// value.docs.forEach((element) {
//   Product p =Product.fromJson(element.data());
//   p.id=element.id;
//   products.add(p);
// });

  // } );

  }
}