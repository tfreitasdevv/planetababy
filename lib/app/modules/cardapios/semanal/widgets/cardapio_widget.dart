import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidymodularmobx3/app/modules/cardapios/models/cardapio_model.dart';

class CardapioWidget extends StatelessWidget {

  final cardapioModel = Modular.get<CardapioModel>();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Text(cardapioModel.data),
          )
        ],
      ),
    );
  }
}