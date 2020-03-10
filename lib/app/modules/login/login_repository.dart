import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidymodularmobx3/app/modules/login/models/user_model.dart';
import 'package:slidymodularmobx3/app/shared/custom_dio/custom_dio.dart';
import 'package:slidymodularmobx3/app/shared/local_user/local_user.dart';

class LoginRepository {
  final dio = Modular.get<CustomDio>();
  final userModel = Modular.get<UserModel>();
  final localUser = Modular.get<LocalUser>();
  final int prazo = 86400000;

  Future<bool> authenticate() async {
    var corpo = {"email": "${userModel.email}", "senha": "${userModel.senha}"};
    Response response;
    try {
      response = await dio.dioClient.post("/login", data: corpo);
      print("Status Code Dio: ${response.statusCode}");
      print("Headers Dio: ${response.headers["authorization"]}");
      String token = response.headers["authorization"].toString();
      await localUser.setToken(token.substring(1, token.length - 1));
      await localUser.setEmail(userModel.email.toLowerCase());
      await localUser.setExpiracao(
          DateTime.now().add(Duration(milliseconds: prazo)).toString());
      print(
          "<<<<<<<<<<<<<<<<<IMPRIMINDO EXPIRACAO NO REPOSITORY>>>>>>>>>>>>>>>>");
      print(localUser.expiracao);
      print(
          "<<<<<<<<<<<<<<<<<FIM IMPRIMINDO EXPIRACAO NO REPOSITORY>>>>>>>>>>>>>>>>");
      //Modular.to.pushReplacementNamed('/home');
      return true;
    } catch (e) {
      print(
          "-------------------------ERRO NO LOGIN---------------------------");
      return false;
      // throw DioError;
    }
  }

  Future<bool> refreshToken() async {
    Response response;
    try {
      response = await dio.dioClient.post("/auth/refresh_token",
          options: Options(headers: {"Authorization": "${localUser.token}"}));
      print("Status Code Dio: ${response.statusCode}");
      print("Headers Dio: ${response.headers["authorization"]}");
      String token = response.headers["authorization"].toString();
      await localUser.setToken(token.substring(1, token.length - 1));
      await localUser.setEmail(localUser.email.toLowerCase());
      await localUser.setExpiracao(
          DateTime.now().add(Duration(milliseconds: prazo)).toString());
      print(
          "<<<<<<<<<<<<<<<<<IMPRIMINDO EXPIRACAO NO REPOSITORY>>>>>>>>>>>>>>>>");
      print(localUser.expiracao);
      print(
          "<<<<<<<<<<<<<<<<<FIM IMPRIMINDO EXPIRACAO NO REPOSITORY>>>>>>>>>>>>>>>>");
      //Modular.to.pushReplacementNamed('/home');
      return true;
    } catch (e) {
      print(
          "-------------------------ERRO NO REFRESH---------------------------");
      return false;
      // throw DioError;
    }
  }

  Future lougout() async {
    await localUser.setEmail(null);
    await localUser.setToken(null);
    await localUser.setExpiracao(null);
    await localUser.cleanNome();
    await localUser.removeAllAlunos();
    Modular.to.pushReplacementNamed('/login');
  }

  Future<bool> recuperarResponsavel() async {
    Response response;
    try {
      response = await dio.dioClient.get(
          "responsaveis/email?value=${localUser.email}",
          options: Options(headers: {"Authorization": "${localUser.token}"}));
      await localUser.setNome(response.data['nome']);
      List<String> alunos = [];
      if (localUser.alunosCarregados == false) {
        for (var json in (response.data['alunos'] as List)) {
          alunos.add(json['nome']);
        }
        for (var item in alunos) {
          localUser.addAlunos(item);
        }
        localUser.setACTrue();
      }

      return true;
    } catch (e) {
      print(
          "-------------------------ERRO NO LOGIN---------------------------");
      return false;
      // throw DioError;
    }
  }
}
