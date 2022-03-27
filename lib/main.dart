import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/app_route.dart';
import 'package:flutter_app2/data/local/cache_helper.dart';
import 'package:flutter_app2/domain/cubit/checkConnection/connect_cubit.dart';
import 'package:flutter_app2/domain/cubit/checkConnection/connect_state.dart';
import 'package:flutter_app2/domain/cubit/getProducts/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_context/one_context.dart';
import 'package:sizer/sizer.dart';

import 'Presentation/dialogs/no_internet.dart';
import 'bloc_oberver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await CacheHelper.init();

  BlocOverrides.runZoned(() {
    runApp(DevicePreview(
      enabled: false,
      builder: (_) => const MyApp(),
    ));
  }, blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CheckConnectCubit()..initialConnection()),
        BlocProvider(create: (_) => ProductCubit()),
      ],
      child: Sizer(
        builder: (context, orientation, dType) {
          return BlocListener<CheckConnectCubit, CheckConnectionState>(
            listener: (context, state) {
              if (state is DisConnect) {
                log('Internet DisConnected');
                OneContext().showDialog(
                  barrierDismissible: false,
                  builder: (context) => NoInternetDialog(
                    dismiss: false,
                  ),
                );
              } else if (state is Connect) {
                log('Connected');

                OneContext().popAllDialogs();
              }
            },
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRoute().onGenerateRoute,
              builder: OneContext().builder,
            ),
          );
        },
      ),
    );
  }
}
