import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidymodularmobx3/app/modules/login/login_controller.dart';
import 'package:slidymodularmobx3/app/shared/local_user/local_user.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Planeta Baby"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final localUser = Modular.get<LocalUser>();
  final loginController = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Text("Sair"),
              onPressed: () {
                loginController.logout();
              })
        ],
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Modular.to.pushNamed('/cardapios');
                      },
                      child: Text(
                        "Cardápios",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      color: Theme.of(context).primaryColor,
                      elevation: 6,
                      padding: EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    RaisedButton(
                      onPressed: ()  {
                        print("Usuário logado: " + localUser.email.toString());
                        print("Token: " + localUser.token.toString());
                        print("Expiracao: " + localUser.expiracao.toString());
                        loginController.recuperarResponsavel();
                        Modular.to.pushNamed('/home/meusdados');
                      },
                      child: Text(
                        "Meus dados",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      color: Theme.of(context).primaryColor,
                      elevation: 6,
                      padding: EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
