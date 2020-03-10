import 'package:connectivity/connectivity.dart';

class Conectividade{
  Future<bool> checarInternet()async{
    var conectividade = await (Connectivity().checkConnectivity());
    if(conectividade == ConnectivityResult.none){
      return false;
    } else {
      return true;
    }
  }
}