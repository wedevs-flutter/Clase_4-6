import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logic_class_flutter/models/UserModel.dart';
import 'package:toast/toast.dart';

class LogInpage extends StatefulWidget {
  @override
  _LogInpageState createState() => _LogInpageState();
}

class _LogInpageState extends State<LogInpage> {
//bloque pantalla portrait
  void bloque() {
    //accedemos a los serviocion
    SystemChrome.setPreferredOrientations([
      //añadimos a la lista solo los admitidos
      //portrait = modo vertical
      //landscape = modo Horizontal

      DeviceOrientation
          .portraitUp, //con estos dos Device solo admitimos la opcion portrait
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    //llamar el metodo bloque para bloquear pantalla
    bloque();
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Log In"),
          TextField(
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Password"),
          ),
          RaisedButton(
            onPressed: () {
              //lanza el toast
              Toast.show("Exitoso...!", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              //manda a la pantalla /singUp registrada en los routes de main.dart
              Navigator.of(context).pushNamed('/Home',
                  arguments: UserModel(
                      usuario: "user",
                      email: "bj60@gmail.com",
                      pass: "123456789"));
            },
            child: Text("iniciar"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/SignUp');
            },
            child: Text("registarse"),
          )
        ],
      ),
    );
  }
}
