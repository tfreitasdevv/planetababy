// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardapios_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardapiosController on _CardapiosBase, Store {
  final _$dataSelecionadaAtom = Atom(name: '_CardapiosBase.dataSelecionada');

  @override
  DateTime get dataSelecionada {
    _$dataSelecionadaAtom.context.enforceReadPolicy(_$dataSelecionadaAtom);
    _$dataSelecionadaAtom.reportObserved();
    return super.dataSelecionada;
  }

  @override
  set dataSelecionada(DateTime value) {
    _$dataSelecionadaAtom.context.conditionallyRunInAction(() {
      super.dataSelecionada = value;
      _$dataSelecionadaAtom.reportChanged();
    }, _$dataSelecionadaAtom, name: '${_$dataSelecionadaAtom.name}_set');
  }

  final _$_CardapiosBaseActionController =
      ActionController(name: '_CardapiosBase');

  @override
  dynamic setDataSelecionada(DateTime value) {
    final _$actionInfo = _$_CardapiosBaseActionController.startAction();
    try {
      return super.setDataSelecionada(value);
    } finally {
      _$_CardapiosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'dataSelecionada: ${dataSelecionada.toString()}';
    return '{$string}';
  }
}
