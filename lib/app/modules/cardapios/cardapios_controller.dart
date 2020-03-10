import 'package:mobx/mobx.dart';

import '../../shared/global_var.dart';

part 'cardapios_controller.g.dart';

class CardapiosController = _CardapiosBase with _$CardapiosController;

abstract class _CardapiosBase with Store {

  @observable
  DateTime dataSelecionada = dataReferencia;

  @action
  setDataSelecionada(DateTime value) => dataSelecionada = value;

}
