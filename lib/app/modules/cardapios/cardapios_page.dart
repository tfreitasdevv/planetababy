import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidymodularmobx3/app/modules/cardapios/semanal/semanal_controller.dart';

import 'cardapios_controller.dart';

class CardapiosPage extends StatefulWidget {
  final String title;
  const CardapiosPage({Key key, this.title = "Cardápios"}) : super(key: key);

  @override
  _CardapiosPageState createState() => _CardapiosPageState();
}

class _CardapiosPageState
    extends ModularState<CardapiosPage, CardapiosController> {
  final semanalController = Modular.get<SemanalController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/BGHome1.png",
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      "Cardápio Semanal",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: Theme.of(context).primaryColor,
                    elevation: 6,
                    padding: EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    onPressed: () {
                      semanalController.setList(1);
                      Modular.to.popAndPushNamed('/cardapios/semanal');
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
