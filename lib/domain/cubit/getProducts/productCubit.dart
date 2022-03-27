

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/data/api/produtApi.dart';
import 'package:flutter_app2/domain/cubit/getProducts/productStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product.dart';

class ProductCubit extends Cubit<ProductStates>
{

  BuildContext context;
  ProductCubit(this.context) : super(ProductsLoading());

  static ProductCubit get(context)=>BlocProvider.of(context);
  List<Product> productsList=[];

 streamListen()
  {

print('done');

   FirebaseFirestore.instance.collection("Products").get().asStream()
      .
  listen((event) {
    if(
    event.docChanges.any((element) => true)) {

    }



  });





  }


  getAllProduct()
  {
    ProductApi api = ProductApi(productsList);
    api.fetchfrist().then((value)
    {

      productsList=value;

      emit(ProductsSuccess());
    });
  }
  update()
  {
    ProductApi api = ProductApi(productsList);
 api.getProducts();
 emit(Update());
  }



}