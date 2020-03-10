import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidymodularmobx3/app/modules/login/login_repository.dart';


part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {

  final repo = Modular.get<LoginRepository>();

  Future<bool> login() async {
   return await repo.authenticate();
  }

  void logout()async{
    await repo.lougout();
  }

  void refresToken() async {
    await repo.refreshToken();
  }

  void recuperarResponsavel() async {
    await repo.recuperarResponsavel();
  }

}
