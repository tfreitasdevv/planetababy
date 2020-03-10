// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocalUser on _LocalUserBase, Store {
  final _$emailAtom = Atom(name: '_LocalUserBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$tokenAtom = Atom(name: '_LocalUserBase.token');

  @override
  String get token {
    _$tokenAtom.context.enforceReadPolicy(_$tokenAtom);
    _$tokenAtom.reportObserved();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.context.conditionallyRunInAction(() {
      super.token = value;
      _$tokenAtom.reportChanged();
    }, _$tokenAtom, name: '${_$tokenAtom.name}_set');
  }

  final _$expiracaoAtom = Atom(name: '_LocalUserBase.expiracao');

  @override
  String get expiracao {
    _$expiracaoAtom.context.enforceReadPolicy(_$expiracaoAtom);
    _$expiracaoAtom.reportObserved();
    return super.expiracao;
  }

  @override
  set expiracao(String value) {
    _$expiracaoAtom.context.conditionallyRunInAction(() {
      super.expiracao = value;
      _$expiracaoAtom.reportChanged();
    }, _$expiracaoAtom, name: '${_$expiracaoAtom.name}_set');
  }

  final _$nomeAtom = Atom(name: '_LocalUserBase.nome');

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

  final _$alunosAtom = Atom(name: '_LocalUserBase.alunos');

  @override
  List<String> get alunos {
    _$alunosAtom.context.enforceReadPolicy(_$alunosAtom);
    _$alunosAtom.reportObserved();
    return super.alunos;
  }

  @override
  set alunos(List<String> value) {
    _$alunosAtom.context.conditionallyRunInAction(() {
      super.alunos = value;
      _$alunosAtom.reportChanged();
    }, _$alunosAtom, name: '${_$alunosAtom.name}_set');
  }

  final _$alunosCarregadosAtom = Atom(name: '_LocalUserBase.alunosCarregados');

  @override
  bool get alunosCarregados {
    _$alunosCarregadosAtom.context.enforceReadPolicy(_$alunosCarregadosAtom);
    _$alunosCarregadosAtom.reportObserved();
    return super.alunosCarregados;
  }

  @override
  set alunosCarregados(bool value) {
    _$alunosCarregadosAtom.context.conditionallyRunInAction(() {
      super.alunosCarregados = value;
      _$alunosCarregadosAtom.reportChanged();
    }, _$alunosCarregadosAtom, name: '${_$alunosCarregadosAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$setEmailAsyncAction = AsyncAction('setEmail');

  @override
  Future setEmail(String value) {
    return _$setEmailAsyncAction.run(() => super.setEmail(value));
  }

  final _$setTokenAsyncAction = AsyncAction('setToken');

  @override
  Future setToken(String value) {
    return _$setTokenAsyncAction.run(() => super.setToken(value));
  }

  final _$setExpiracaoAsyncAction = AsyncAction('setExpiracao');

  @override
  Future setExpiracao(String value) {
    return _$setExpiracaoAsyncAction.run(() => super.setExpiracao(value));
  }

  final _$setNomeAsyncAction = AsyncAction('setNome');

  @override
  Future setNome(String value) {
    return _$setNomeAsyncAction.run(() => super.setNome(value));
  }

  final _$cleanNomeAsyncAction = AsyncAction('cleanNome');

  @override
  Future cleanNome() {
    return _$cleanNomeAsyncAction.run(() => super.cleanNome());
  }

  final _$removeAllAlunosAsyncAction = AsyncAction('removeAllAlunos');

  @override
  Future removeAllAlunos() {
    return _$removeAllAlunosAsyncAction.run(() => super.removeAllAlunos());
  }

  final _$_LocalUserBaseActionController =
      ActionController(name: '_LocalUserBase');

  @override
  dynamic addAlunos(String value) {
    final _$actionInfo = _$_LocalUserBaseActionController.startAction();
    try {
      return super.addAlunos(value);
    } finally {
      _$_LocalUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setACTrue() {
    final _$actionInfo = _$_LocalUserBaseActionController.startAction();
    try {
      return super.setACTrue();
    } finally {
      _$_LocalUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setACFalse() {
    final _$actionInfo = _$_LocalUserBaseActionController.startAction();
    try {
      return super.setACFalse();
    } finally {
      _$_LocalUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},token: ${token.toString()},expiracao: ${expiracao.toString()},nome: ${nome.toString()},alunos: ${alunos.toString()},alunosCarregados: ${alunosCarregados.toString()}';
    return '{$string}';
  }
}
