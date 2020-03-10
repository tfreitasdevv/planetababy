import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidymodularmobx3/app/modules/cardapios/models/cardapio_model.dart';
import 'package:slidymodularmobx3/app/modules/cardapios/semanal/semanal_repository.dart';

part 'semanal_controller.g.dart';

class SemanalController = _SemanalBase with _$SemanalController;

abstract class _SemanalBase with Store {

  final repo = Modular.get<SemanalRepository>();

  @observable
  ObservableFuture<List<CardapioModel>> listCardapios;

  @observable
  int index = 1;

  @action
  setIndex(int value) => index = value;

  @action
  setList(int value){
    print("---------------ANTES DO TRY DO SETLIST--------------------------");
    int index2 = value;
    try {
    listCardapios = repo.recuperar(index2).asObservable();
    print(listCardapios.toString());
    } catch (e) {
      print("---------------ERRO NO SETLIST--------------------------");
      print(e.toString());
    }
    print("---------------DEPOIS DO TRY DO SETLIST--------------------------");
  }

  @action
  setListCustom(int value){
    print("---------------ANTES DO TRY DO SETLIST--------------------------");
    int index2 = value;
    try {
    listCardapios = repo.recuperarCustom(index2).asObservable();
    print(listCardapios.toString());
    } catch (e) {
      print("---------------ERRO NO SETLIST--------------------------");
      print(e.toString());
    }
    print("---------------DEPOIS DO TRY DO SETLIST--------------------------");
  }
}
