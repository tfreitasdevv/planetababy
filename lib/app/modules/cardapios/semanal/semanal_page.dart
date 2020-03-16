import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidymodularmobx3/app/modules/cardapios/semanal/semanal_controller.dart';
import 'package:slidymodularmobx3/app/shared/global_var.dart';

import '../../../shared/global_var.dart';
import '../cardapios_controller.dart';

class SemanalPage extends StatefulWidget {
  final String title;
  const SemanalPage({Key key, this.title = "Semanal"}) : super(key: key);

  @override
  _SemanalPageState createState() => _SemanalPageState();
}

class _SemanalPageState extends ModularState<SemanalPage, SemanalController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int currentIndex = 0;
  final cardapiosController = Modular.get<CardapiosController>();
  bool customDate = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
            onTap: (index) {
              controller.setIndex(index);
              customDate
                  ? controller.setListCustom(index + 1)
                  : controller.setList(index + 1);
              print(index);
            },
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Iniciação alimentar",
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  "Normal",
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: FittedBox(
                  child: Text(
                    "Diferenciado",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]),
        title: Text(getInicioFim()),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 32),
            child: IconButton(
                icon: Icon(
                  Icons.date_range,
                  color: Colors.white,
                  size: 36,
                ),
                onPressed: () {
                  showDatePicker(
                          locale: Locale("pt"),
                          context: context,
                          initialDate: dataReferencia,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2025))
                      .then((value) {
                    cardapiosController.setDataSelecionada(value);
                    print(
                        "-------------------DATA SELECIONADA NO PICKER-------------------------");
                    print(cardapiosController.dataSelecionada);
                    customDate = true;
                    controller.setListCustom(1);
                    setState(() {
                      getInicioFim();
                    });
                  });
                }),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: 450,
            child: Image.asset(
              "assets/images/BGHome1.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                _buildTab(),
                _buildTab(),
                _buildTab(),
              ]),
        ],
      ),
    );
  }

  Widget _buildTab() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Observer(builder: (_) {
        if (controller.listCardapios.error != null &&
            controller.listCardapios.error.toString().contains("404")) {
          return Center(
            child: Container(
              child: Text(
                "Não existem cardápios cadastrados para a data informada",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
        if (controller.listCardapios.error != null) {
          return Center(
            child: Text(controller.listCardapios.error.toString()),
          );
        }
        if (controller.listCardapios.value == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.listCardapios.value != null &&
            controller.listCardapios.value.length < 1) {
          return Center(
            child:
                Text("Não existem Cardápios cadastrados para a data informada"),
          );
        }

        var list = controller.listCardapios.value;

        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: _buildCard(list, index),
              );
            });
      }),
    );
  }

  Widget _buildCard(List lista, int indice) {
    return Card(
      elevation: 4,
      color: _color(indice),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: _buildImage(lista, indice),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: <Widget>[
                    _buildItemCardapio("Suco: ", lista[indice].suco),
                    Divider(),
                    _buildItemCardapio("Colação: ", lista[indice].colacao),
                    Divider(),
                    _buildItemCardapio("Lanche: ", lista[indice].lanche),
                    Divider(),
                    _buildItemCardapio("Refeição: ", lista[indice].almocoJanta),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Image _buildImage(List lista, int indice) {
    String dataString = lista[indice].data;
    DateTime data = DateTime.parse(dataString);
    print(data);
    int dia = data.weekday;
    print(dia);
    switch (dia) {
      case 1:
        return Image.asset(
          "assets/images/2afeira.png",
          fit: BoxFit.contain,
          height: 120,
        );
      case 2:
        return Image.asset(
          "assets/images/3afeira.png",
          fit: BoxFit.contain,
          height: 120,
        );
      case 3:
        return Image.asset(
          "assets/images/4afeira.png",
          fit: BoxFit.contain,
          height: 120,
        );
      case 4:
        return Image.asset(
          "assets/images/5afeira.png",
          fit: BoxFit.contain,
          height: 120,
        );
      case 5:
        return Image.asset(
          "assets/images/6afeira.png",
          fit: BoxFit.contain,
          height: 120,
        );
        break;
      default:
        return null;
    }
  }

  Widget _buildItemCardapio(String title, String descricao) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 32,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 68,
          child: Text(
            descricao,
            style: TextStyle(),
          ),
        )
      ],
    );
  }

  Color _color(int indice) {
    switch (indice) {
      case 0:
        return Colors.white;
        break;
      case 1:
        return Colors.white;
        break;
      case 2:
        return Colors.white;
        break;
      case 3:
        return Colors.white;
        break;
      case 4:
        return Colors.white;
        break;
      default:
        return Colors.white;
        break;
    }
  }

  void setControllerIndex() {
    currentIndex = _tabController.index;
  }

  String getInicioFim() {
    DateTime now = cardapiosController.dataSelecionada;
    print(">>>>>>>>>>>>>>>>>>>>Data Referência: $now");
    int diaSemana = now.weekday;
    print(diaSemana);
    DateTime inicio;
    DateTime fim;
    int diaInicio;
    int mesInicio;
    int diaFim;
    int mesFim;
    String title;
    switch (diaSemana) {
      case 1:
        inicio = now;
        diaInicio = inicio.day;
        mesInicio = inicio.month;
        print("$diaInicio / $mesInicio");
        fim = now.add(Duration(days: 4));
        diaFim = fim.day;
        mesFim = fim.month;
        print("$diaFim / $mesFim");
        break;
      case 2:
        inicio = now.add(Duration(days: -1));
        diaInicio = inicio.day;
        mesInicio = inicio.month;
        print("$diaInicio / $mesInicio");
        fim = now.add(Duration(days: 3));
        diaFim = fim.day;
        mesFim = fim.month;
        print("$diaFim / $mesFim");
        break;
      case 3:
        inicio = now.add(Duration(days: -2));
        diaInicio = inicio.day;
        mesInicio = inicio.month;
        print("$diaInicio / $mesInicio");
        fim = now.add(Duration(days: 2));
        diaFim = fim.day;
        mesFim = fim.month;
        print("$diaFim / $mesFim");
        break;
      case 4:
        inicio = now.add(Duration(days: -3));
        diaInicio = inicio.day;
        mesInicio = inicio.month;
        print("$diaInicio / $mesInicio");
        fim = now.add(Duration(days: 1));
        diaFim = fim.day;
        mesFim = fim.month;
        print("$diaFim / $mesFim");
        break;
      case 5:
        inicio = now.add(Duration(days: -4));
        diaInicio = inicio.day;
        mesInicio = inicio.month;
        print("$diaInicio / $mesInicio");
        fim = now;
        diaFim = fim.day;
        mesFim = fim.month;
        print("$diaFim / $mesFim");
        break;
      case 6:
        inicio = now.add(Duration(days: 2));
        diaInicio = inicio.day;
        mesInicio = inicio.month;
        print("$diaInicio / $mesInicio");
        fim = now.add(Duration(days: 6));
        diaFim = fim.day;
        mesFim = fim.month;
        print("$diaFim / $mesFim");
        break;
      case 7:
        inicio = now.add(Duration(days: 1));
        diaInicio = inicio.day;
        mesInicio = inicio.month;
        print("$diaInicio / $mesInicio");
        fim = now.add(Duration(days: 5));
        diaFim = fim.day;
        mesFim = fim.month;
        print("$diaFim / $mesFim");
        break;
    }
    String sDiaInicio;
    if (diaInicio < 10) {
      sDiaInicio = ("0$diaInicio");
    } else {
      sDiaInicio = diaInicio.toString();
    }
    String sDiaFim;
    if (diaFim < 10) {
      sDiaFim = ("0$diaFim");
    } else {
      sDiaFim = diaFim.toString();
    }
    String sMesInicio;
    if (mesInicio < 10) {
      sMesInicio = ("0$mesInicio");
    } else {
      sMesInicio = mesInicio.toString();
    }
    String sMesFim;
    if (mesFim < 10) {
      sMesFim = ("0$mesFim");
    } else {
      sMesFim = mesFim.toString();
    }

    title = "$sDiaInicio/$sMesInicio - $sDiaFim/$sMesFim";
    return title;
  }
}
