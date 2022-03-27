import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/Presentation/Modules/splash.dart';
import 'package:flutter_app2/Presentation/dialouges/noInterNet.dart';
import 'package:flutter_app2/app_route.dart';
import 'package:flutter_app2/data/local/cacheHelper.dart';
import 'package:flutter_app2/domain/cubit/checkConnection/connect_cubit.dart';
import 'package:flutter_app2/domain/cubit/checkConnection/connect_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app2/domain/cubit/getProducts/productCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_context/one_context.dart';
import 'package:sizer/sizer.dart';
import 'package:bloc/bloc.dart';

import 'bloc_oberver.dart';


 void main()async
{
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

await CacheHelper.init();

 BlocOverrides.runZoned((){

  runApp(DevicePreview(
         enabled: true,
         builder:(_)=>
             MyApp(),

             ));

 },
     blocObserver: MyBlocObserver()

 );



}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>CheckConnectCubit()..initialConnection()),

        BlocProvider(create: (_)=>ProductCubit(_)..getAllProduct()),

      ],
      child: Sizer(
        builder:(context,orientation,dType) {
          return BlocListener<CheckConnectCubit,CheckConnectionState>(
            listener: (context,state)
            {
            if(state is DisConnect)
            {
              print('Internet DisConnected');
            OneContext().showDialog(

                barrierDismissible: false,
                builder: (context)=>NoInterNetDiaoug(dismiss: false,));
            }
            else  if(state is Connect)
              {
                print('Connected');

                OneContext().popAllDialogs();
              }

            },
            child: MaterialApp(
debugShowCheckedModeBanner: false,
onGenerateRoute:AppRoute().onGenerateRoute ,
              builder: OneContext().builder,



        ),
          );
        },
      ),
    );
  }
}
