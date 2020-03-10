import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidymodularmobx3/app/shared/constants.dart';
import 'package:slidymodularmobx3/app/shared/custom_dio/interceptors.dart';

class CustomDio {

  final dioClient = Modular.get<Dio>();

  CustomDio(){
    dioClient.options.baseUrl = URL_BASE;
    dioClient.interceptors.add(CustomInterceptor());
  }

}