import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidymodularmobx3/app/shared/constants.dart';

import '../../../../shared/custom_dio/custom_dio.dart';
import '../../../../shared/local_user/local_user.dart';

class MeusDadosRepository {
  final dio = Modular.get<CustomDio>();
  final localUser = Modular.get<LocalUser>();

  Future<String> recuperarResponsavel() async {
    String url = "${URL_BASE}responsaveis/email?value=${localUser.email}";
    var response = await dio.dioClient.get(url,
        options: Options(headers: {"Authorization": "${localUser.token}"}));
        String nome = response.data["nome"];
        return nome;
    }

  }
