// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semanal_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SemanalController on _SemanalBase, Store {
  final _$listCardapiosAtom = Atom(name: '_SemanalBase.listCardapios');

  @override
  ObservableFuture<List<CardapioModel>> get listCardapios {
    _$listCardapiosAtom.context.enforceReadPolicy(_$listCardapiosAtom);
    _$listCardapiosAtom.reportObserved();
    return super.listCardapios;
  }

  @override
  set listCardapios(ObservableFuture<List<CardapioModel>> value) {
    _$listCardapiosAtom.context.conditionallyRunInAction(() {
      super.listCardapios = value;
      _$listCardapiosAtom.reportChanged();
    }, _$listCardapiosAtom, name: '${_$listCardapiosAtom.name}_set');
  }

  final _$indexAtom = Atom(name: '_SemanalBase.index');

  @override
  int get index {
    _$indexAtom.context.enforceReadPolicy(_$indexAtom);
    _$indexAtom.reportObserved();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.context.conditionallyRunInAction(() {
      super.index = value;
      _$indexAtom.reportChanged();
    }, _$indexAtom, name: '${_$indexAtom.name}_set');
  }

  final _$_SemanalBaseActionController = ActionController(name: '_SemanalBase');

  @override
  dynamic setIndex(int value) {
    final _$actionInfo = _$_SemanalBaseActionController.startAction();
    try {
      return super.setIndex(value);
    } finally {
      _$_SemanalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setList(int value) {
    final _$actionInfo = _$_SemanalBaseActionController.startAction();
    try {
      return super.setList(value);
    } finally {
      _$_SemanalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setListCustom(int value) {
    final _$actionInfo = _$_SemanalBaseActionController.startAction();
    try {
      return super.setListCustom(value);
    } finally {
      _$_SemanalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'listCardapios: ${listCardapios.toString()},index: ${index.toString()}';
    return '{$string}';
  }
}
