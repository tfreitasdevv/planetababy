import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidymodularmobx3/app/modules/login/login_page.dart';
import 'package:slidymodularmobx3/app/modules/login/login_repository.dart';
import 'package:slidymodularmobx3/app/modules/login/models/user_model.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserModel()),
        Bind((i) => LoginRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
