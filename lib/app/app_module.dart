import 'package:dio/dio.dart';
import 'package:slidymodularmobx3/app/common_pages/splash/splash_controller.dart';
import 'package:slidymodularmobx3/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:slidymodularmobx3/app/app_widget.dart';
import 'package:slidymodularmobx3/app/common_pages/splash/splash_page.dart';
import 'package:slidymodularmobx3/app/modules/cardapios/cardapios_module.dart';
import 'package:slidymodularmobx3/app/shared/custom_dio/custom_dio.dart';
import 'package:slidymodularmobx3/app/shared/local_storage/local_storage.dart';
import 'package:slidymodularmobx3/app/shared/local_user/local_user.dart';

import 'modules/home/home_module.dart';
import 'modules/login/login_controller.dart';
import 'modules/login/login_module.dart';
import 'modules/login/login_repository.dart';
import 'modules/login/models/user_model.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
        Bind((i) => LoginController()),
        Bind((i) => LoginRepository()),
        Bind((i) => UserModel()),
        Bind((i) => LocalUser()),
        Bind((i) => LocalStorage()),
        Bind((i) => Dio()),
        Bind((i) => CustomDio()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/home', module: HomeModule()),
        Router('/login', module: LoginModule()),
        Router('/cardapios', module: CardapiosModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
