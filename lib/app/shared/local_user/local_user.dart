import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidymodularmobx3/app/shared/local_storage/local_storage.dart';
part 'local_user.g.dart';

class LocalUser = _LocalUserBase with _$LocalUser;

abstract class _LocalUserBase with Store {

  final storage = Modular.get<LocalStorage>();

  _LocalUserBase(){
    init();
  }

  @action
  init() async {
    String emailLocal = await storage.get('email');
    String tokenLocal = await storage.get('token');
    String expiracaoLocal = await storage.get('expiracao');
    String nomeLocal = await storage.get('nome');
    if(emailLocal == null || tokenLocal == null){
      email = null;
      token = null;
      expiracao = null;
    } else {
      email = emailLocal;
      token = tokenLocal;
      expiracao = expiracaoLocal;
      nome = nomeLocal;
    }
  }

  @observable
  String email;
  @action
  setEmail(String value) async {
    email = value;
    await storage.put('email', value);
  }

  @observable
  String token;
  @action
  setToken(String value) async {
    token = value;
    await storage.put('token', value);
  }

  @observable
  String expiracao;
  @action
  setExpiracao(String value) async {
    expiracao = value;
    await storage.put('expiracao', value);
  }

  @observable
  String nome = "";
  @action
  setNome(String value) async {
    nome = value;
    await storage.put('nome', value);
  }
  @action
  cleanNome() async {
    nome = "";
    await storage.put('nome', "");
  }

  @observable
  List<String> alunos = [];
  @action
  addAlunos(String value){
    alunos = List.from(alunos..add(value));
  }
  @action
  removeAllAlunos() async {
    setACFalse();
    alunos.clear();
  }

  @observable
  bool alunosCarregados = false;
  @action
  setACTrue(){
    alunosCarregados = true;
  }
  @action
  setACFalse(){
    alunosCarregados = false;
  }


}