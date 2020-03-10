import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidymodularmobx3/app/modules/home/pages/meus_dados/meus_dados_repository.dart';

part 'meus_dados_controller.g.dart';

class MeusDadosController = _MeusDadosBase with _$MeusDadosController;

abstract class _MeusDadosBase with Store {

  final repo = Modular.get<MeusDadosRepository>();
  
  @observable
  String nome = "";

  @action
  setNome (String value) => nome = value;

  @action
  recuperarNome() async{
    try{
      String _nome = await repo.recuperarResponsavel();
      setNome(_nome);
    } catch (e) {
      print("---------------ERRO NO RECUPERAR NOME--------------------------");
      print(e.toString());
    }
  }

}
