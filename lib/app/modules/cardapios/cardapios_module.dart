import 'package:slidymodularmobx3/app/modules/cardapios/semanal/semanal_controller.dart';
import 'package:slidymodularmobx3/app/modules/cardapios/cardapios_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidymodularmobx3/app/modules/cardapios/cardapios_page.dart';
import 'package:slidymodularmobx3/app/modules/cardapios/semanal/semanal_page.dart';
import 'package:slidymodularmobx3/app/modules/cardapios/semanal/semanal_repository.dart';

import 'semanal/semanal_page.dart';

class CardapiosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SemanalController()),
        Bind((i) => CardapiosController()),
        Bind((i) => SemanalRepository()),
        Bind((i) => SemanalPage()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CardapiosPage()),
        Router('/semanal', child: (_, args) => SemanalPage()),
      ];

  static Inject get to => Inject<CardapiosModule>.of();
}
