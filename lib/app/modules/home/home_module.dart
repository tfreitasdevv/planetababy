import 'package:slidymodularmobx3/app/modules/home/pages/meus_dados/meus_dados_controller.dart';
import 'package:slidymodularmobx3/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidymodularmobx3/app/modules/home/home_page.dart';
import 'package:slidymodularmobx3/app/modules/home/pages/meus_dados/meus_dados_page.dart';
import 'package:slidymodularmobx3/app/modules/home/pages/meus_dados/meus_dados_repository.dart';
import 'package:slidymodularmobx3/app/modules/login/login_repository.dart';
import 'package:slidymodularmobx3/app/modules/login/models/user_model.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MeusDadosController()),
        Bind((i) => HomeController()),
        Bind((i) => LoginRepository()),
        Bind((i) => UserModel()),
        Bind((i) => MeusDadosRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/meusdados', child: (_, args) => MeusDadosPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
