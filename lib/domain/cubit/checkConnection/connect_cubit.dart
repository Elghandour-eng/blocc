
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_app2/domain/cubit/checkConnection/connect_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckConnectCubit extends Cubit<CheckConnectionState>
{
  CheckConnectCubit() : super(LoadingConnection());
static CheckConnectCubit get(context)=>BlocProvider.of(context);
  final connectivity= Connectivity();
  bool? hasConnected;


  initialConnection()async
  {
    connectivity.onConnectivityChanged.listen(connectChange);
  }
  void connectChange(ConnectivityResult result)
  {
checkConnection(result);
  }
 Future<bool?> checkConnection(ConnectivityResult result)async
  {
    if(result==ConnectivityResult.none)
      {
        hasConnected=false;
        emit(DisConnect());
      }
    else
      {
        hasConnected=true;
        emit(Connect());
      }
  }
}