import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:slidymodularmobx3/app/modules/cardapios/models/cardapio_model.dart';
import 'package:slidymodularmobx3/app/shared/constants.dart';
import 'package:slidymodularmobx3/app/shared/custom_dio/custom_dio.dart';
import 'package:slidymodularmobx3/app/shared/global_var.dart';
import 'package:slidymodularmobx3/app/shared/local_user/local_user.dart';

import '../cardapios_controller.dart';

class SemanalRepository {
  final dio = Modular.get<CustomDio>();
  final localUser = Modular.get<LocalUser>();
  final cardapiosController = Modular.get<CardapiosController>();
  static var now = dataReferencia;
  String ano = now.year.toString();
  String nSemana = semana().toString();
  String nSemana2 = weekNumber(now).toString();

  static int semana() {
    print("----------INICIO DO METODO SEMANA-------------");
    final date = now;
    print(date);
    final startOfYear = new DateTime(date.year, 1, 1, 0, 0);
    print(startOfYear);
    final firstMonday = startOfYear.weekday;
    print(firstMonday);
    final daysInFirstWeek = 8 - firstMonday;
    print(daysInFirstWeek);
    final diff = date.difference(startOfYear);
    print(diff);
    var weeks = ((diff.inDays - daysInFirstWeek) / 7).ceil();
    print(weeks);
// It might differ how you want to treat the first week
    if (daysInFirstWeek > 3) {
      weeks += 1;
    }
    if (now.weekday == 6 || now.weekday == 7) {
      weeks += 1;
    }
    print(weeks);
    print("----------FIM DO METODO SEMANA-------------");
    return weeks;
  }

  static int weekNumber(DateTime date) {
    print("-----------------------INICIO DO METODO WEEKNUMBER----------------------");
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int weekNumber = ((dayOfYear - date.weekday + 10) / 7).floor();
    if(date.weekday > 5){
      weekNumber++;
    }
    print(date);
    print(weekNumber);
    print("-----------------------FIM DO METODO WEEKNUMBER----------------------");
    return weekNumber;
  }

  int weekNumberCustom(DateTime date) {
    print("-----------------------INICIO DO METODO WEEKNUMBER----------------------");
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int weekNumber = ((dayOfYear - date.weekday + 10) / 7).floor();
    if(date.weekday > 5){
      weekNumber++;
    }
    print(date);
    print(weekNumber);
    print("-----------------------FIM DO METODO WEEKNUMBER----------------------");
    return weekNumber;
  }

  int semanaCustom() {
    print("----------INICIO DO METODO SEMANA CUSTOM-------------");
    final date = cardapiosController.dataSelecionada;
    print(date);
    final startOfYear = new DateTime(date.year, 1, 1, 0, 0);
    print(startOfYear);
    final firstMonday = startOfYear.weekday;
    print(firstMonday);
    final daysInFirstWeek = 8 - firstMonday;
    print(daysInFirstWeek);
    final diff = date.difference(startOfYear);
    print(diff);
    var weeks = ((diff.inDays - daysInFirstWeek) / 7).ceil();
    print(weeks);
// It might differ how you want to treat the first week
    if (daysInFirstWeek > 3) {
      weeks += 1;
    }
    if (now.weekday == 6 || now.weekday == 7) {
      weeks += 1;
    }
    print(weeks);
    print("----------FIM DO METODO SEMANA CUSTOM-------------");
    return weeks;
  }

  Future<List<CardapioModel>> recuperar(int index) async {
    print(now);
    print(ano);
    print(nSemana2);
    String tipo = index.toString();
    String url =
        "${URL_BASE}cardapios/semana/tipo?semana=$nSemana2&ano=$ano&tipo=$tipo";
    var response = await dio.dioClient.get(url,
        options: Options(headers: {"Authorization": "${localUser.token}"}));
    List<CardapioModel> list = [];
    for (var json in (response.data as List)) {
      CardapioModel model = CardapioModel(
          id: json['id'],
          data: json['data'],
          colacao: json['colacao'],
          lanche: json['lanche'],
          almocoJanta: json['almocoJanta'],
          suco: json['suco'],
          semana: json['semana'],
          ano: json['ano'],
          tipoCardapio: json['tipoCardapio']['descricao']);
      list.add(model);
    }
    print("------------APÓS EXECUÇÃO DO RECUPERAR-------------");
    return list;
  }

  Future<List<CardapioModel>> recuperarCustom(int index) async {
    String nSemanaCustom = weekNumberCustom(cardapiosController.dataSelecionada).toString();
    String anoCustom = cardapiosController.dataSelecionada.year.toString();
    print(now);
    print(ano);
    print(nSemana2);
    String tipo = index.toString();
    String url =
        "${URL_BASE}cardapios/semana/tipo?semana=$nSemanaCustom&ano=$anoCustom&tipo=$tipo";
    var response = await dio.dioClient.get(url,
        options: Options(headers: {"Authorization": "${localUser.token}"}));
    List<CardapioModel> list = [];
    for (var json in (response.data as List)) {
      CardapioModel model = CardapioModel(
          id: json['id'],
          data: json['data'],
          colacao: json['colacao'],
          lanche: json['lanche'],
          almocoJanta: json['almocoJanta'],
          suco: json['suco'],
          semana: json['semana'],
          ano: json['ano'],
          tipoCardapio: json['tipoCardapio']['descricao']);
      list.add(model);
    }
    print("------------APÓS EXECUÇÃO DO RECUPERAR CUSTOM-------------");
    return list;
  }
}
