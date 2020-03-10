import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidymodularmobx3/app/modules/home/pages/meus_dados/meus_dados_controller.dart';
import 'package:slidymodularmobx3/app/shared/local_user/local_user.dart';

class MeusDadosPage extends StatefulWidget {
  final String title;
  const MeusDadosPage({Key key, this.title = "Meus Dados"}) : super(key: key);

  @override
  _MeusDadosPageState createState() => _MeusDadosPageState();
}

class _MeusDadosPageState
    extends ModularState<MeusDadosPage, MeusDadosController> {
  final localUser = Modular.get<LocalUser>();

  @override
  void initState() {
    super.initState();
    controller.recuperarNome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(18),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              color: Colors.white10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Nome",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.01,
                  ),
                  Observer(builder: (_) {
                    return Text(
                      localUser.nome,
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    );
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                  ),
                  Text(
                    "Alunos",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.8,
                    child: Observer(builder: (_) {
                        List<String> alunos = [];
                        alunos = localUser.alunos;
                        return ListView.builder(
                            itemCount: alunos.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Theme.of(context).primaryColor,
                                ),
                                title: Text(
                                  alunos[index].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              );
                            });
                      }),
                  ),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.person,
                  //     size: 40,
                  //     color: Theme.of(context).primaryColor,
                  //   ),
                  //   title: Text(
                  //     "Maria da Silva",
                  //     style:
                  //         TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  //   ),
                  // ),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.person,
                  //     size: 40,
                  //     color: Theme.of(context).primaryColor,
                  //   ),
                  //   title: Text(
                  //     "Joaquim Pereira",
                  //     style:
                  //         TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  //   ),
                  // ),
                  SizedBox(
                    height: 26,
                  ),
                  Container(
                    height: 60,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Alterar senha",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
