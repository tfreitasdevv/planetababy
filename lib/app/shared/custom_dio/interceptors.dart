import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidymodularmobx3/app/shared/local_user/local_user.dart';

class CustomInterceptor extends InterceptorsWrapper {
  final localUser = Modular.get<LocalUser>();

  @override
  Future onRequest(RequestOptions options) {
    //options.headers = {"Authorization": localUser.token};
    print("REQUEST[${options?.method}] => PATH: ${options?.path}");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(
        "RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path}");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    int statusCode = err?.response?.statusCode;
    print("ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    switch (statusCode) {
      case 401:
        //Modular.to.pushNamed('/teste');
        break;
      case 403:
        break;
      case 404:
        break;
      default:
        Modular.to.pushNamed('/login');
    }
    return super.onError(err);
  }
}
