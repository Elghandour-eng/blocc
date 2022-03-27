import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as s;
import 'package:flutter_app2/data/models/product.dart';
import 'package:flutter_app2/domain/cubit/getProducts/productCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/cubit/getProducts/productStates.dart';

class SignInScreen extends StatelessWidget {

  addProduct()async
  {
    s.FirebaseFirestore.instance.collection('Users').doc('User.id').collection("favourites").doc().set(
        {
          'Product 1':'Name',
        });

  }
  @override
  Widget build(BuildContext context) {
    return

BlocBuilder<ProductCubit,ProductStates>(
  bloc: ProductCubit.get(context),
    builder: (context, state) {


  return Scaffold(
    body:

       StreamBuilder(
         stream:ProductCubit.get(context).streamListen() ,
         builder:(context, snapshot) {
           return     snapshot.connectionState==ConnectionState.none?
           GridView.builder(

              itemCount: ProductCubit.get(context).productsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder:
                  (context,index) {
                    return InkWell(
                      onTap: () {
                        addProduct();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30, width: 30, color: Colors.red,
                          child: Center(child: Text(ProductCubit
                              .get(context)
                              .productsList[index].name!)),
                        ),
                      ),
                    );
                  }

  ):Text('data');}
       ));



});




  }

}
