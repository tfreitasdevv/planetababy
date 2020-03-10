// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meus_dados_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MeusDadosController on _MeusDadosBase, Store {
  final _$nomeAtom = Atom(name: '_MeusDadosBase.nome');

  @override
  String get nome {
    _$nomeAtom.context.enforceReadPolicy(_$nomeAtom);
    _$nomeAtom.reportObserved();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.context.conditionallyRunInAction(() {
      super.nome = value;
      _$nomeAtom.reportChanged();
    }, _$nomeAtom, name: '${_$nomeAtom.name}_set');
  }

  final _$recuperarNomeAsyncAction = AsyncAction('recuperarNome');

  @override
  Future recuperarNome() {
    return _$recuperarNomeAsyncAction.run(() => super.recuperarNome());
  }

  final _$_MeusDadosBaseActionController =
      ActionController(name: '_MeusDadosBase');

  @override
  dynamic setNome(String value) {
    final _$actionInfo = _$_MeusDadosBaseActionController.startAction();
    try {
      return super.setNome(value);
    } finally {
      _$_MeusDadosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'nome: ${nome.toString()}';
    return '{$string}';
  }
}
