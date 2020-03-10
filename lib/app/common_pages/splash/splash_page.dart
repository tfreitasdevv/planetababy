import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidymodularmobx3/app/shared/conectividade/conectividade.dart';
import 'package:slidymodularmobx3/app/shared/local_user/local_user.dart';

import '../../modules/login/login_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final localUser = Modular.get<LocalUser>();
  final loginController = Modular.get<LoginController>();

  bool conectado = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) async {
      bool internet = await Conectividade().checarInternet();
      if (!internet) {
        _erroInternet();
      } else {
        loginController.refresToken();
        String email = localUser.email;
        String token = localUser.token;
        print("TENTANDO IMPRIMIR EXPIRACAO ANTES DO PARSE");
        print(DateTime.now());
        print(localUser.expiracao);
        DateTime expiracao = DateTime.tryParse(localUser.expiracao.toString());
        print(expiracao);
        if (email == null ||
            token == null ||
            expiracao.isBefore(DateTime.now())) {
          localUser.setEmail(null);
          localUser.setToken(null);
          Modular.to.pushReplacementNamed('/login');
        } else {
          Modular.to.pushReplacementNamed('/home');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "assets/images/Splash1.png",
        fit: BoxFit.fill,
      ),
    );
  }

  Future<void> _erroInternet() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erro de conexão'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Não foi possível conectar à internet. Verifique sua conexão'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                exit(0);
              },
            ),
          ],
        );
      },
    );
  }
}
