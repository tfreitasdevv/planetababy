import 'package:mobx/mobx.dart';
part 'user_model.g.dart';

class UserModel = _UserModelBase with _$UserModel;

abstract class _UserModelBase with Store {

  @observable
  String email;
  @action
  changeEmail(String value) => email = value;  

  @observable
  String senha;
  @action
  changeSenha(String value) => senha = value; 
  
}