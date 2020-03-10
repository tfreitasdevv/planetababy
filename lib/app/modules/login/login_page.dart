import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidymodularmobx3/app/modules/login/login_controller.dart';
import 'package:slidymodularmobx3/app/modules/login/models/user_model.dart';
import 'package:slidymodularmobx3/app/shared/conectividade/conectividade.dart';
import 'package:slidymodularmobx3/app/shared/local_user/local_user.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Planeta Baby"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final userModel = Modular.get<UserModel>();
  final localUser = Modular.get<LocalUser>();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

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
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value.isEmpty ||
                              !value.contains("@") ||
                              !value.contains(".")) {
                            return 'Digite um e-mail válido';
                          }
                          return null;
                        },
                        onChanged: userModel.changeEmail,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            labelText: "E-mail"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _senhaController,
                        validator: (value) {
                          if (value.isEmpty || value.length < 2) {
                            return 'A senha precisa conter pelo menos 3 caracteres';
                          }
                          return null;
                        },
                        onChanged: userModel.changeSenha,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24)),
                            labelText: "Senha"),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                            color: Colors.white54,
                            onPressed: () async {
                              bool internet =
                                  await Conectividade().checarInternet();
                              if (internet == true) {
                                print("Internet conectada");
                              } else {
                                print("Internet desconectada");
                              }
                            },
                            child: Text(
                              "ESQUECI A SENHA",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54),
                            )),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      RaisedButton(
                        onPressed: () async {
                          bool internet =
                              await Conectividade().checarInternet();
                          if (internet) {
                            if (_formKey.currentState.validate()) {
                              _tentarLogin();
                            } else {
                              return null;
                            }
                          } else {
                            return _erroInternet();
                          }
                        },
                        child: Text(
                          "Fazer Login",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        color: Theme.of(context).primaryColor,
                        elevation: 6,
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      // SizedBox(
                      //   height: 8,
                      // ),
                      // RaisedButton(
                      //   onPressed: () {
                      //     print("Usuário logado: " + localUser.email.toString());
                      //     print("Token: " + localUser.token.toString());
                      //   },
                      //   child: Text(
                      //     "Testar Token",
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   color: Theme.of(context).primaryColor,
                      // ),
                      // SizedBox(
                      //   height: 8,
                      // ),
                      // RaisedButton(
                      //   onPressed: controller.logout,
                      //   child: Text(
                      //     "Logout",
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   color: Theme.of(context).primaryColor,
                      // )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  _tentarLogin() async {
    bool result = await controller.login();
    if (result) {
      Modular.to.pushReplacementNamed('/home');
    } else {
      _alertErro();
    }
  }

  Future<void> _alertErro() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erro no login'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('E-mail ou senha inválidos'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('ESQUECI A SENHA'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
              },
            ),
          ],
        );
      },
    );
  }
}
