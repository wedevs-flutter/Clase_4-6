import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

class LogInpage extends StatefulWidget {
  @override
  _LogInpageState createState() => _LogInpageState();
}

class _LogInpageState extends State<LogInpage> {
//bloque pantalla portrait
  void bloque() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
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
            decoration: InputDecoration(
              labelText: "Email"
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Password"
            ),
          ),
          RaisedButton(
            onPressed: () {
              Toast.show("Exitoso...!", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
              Navigator.of(context).pushNamed('/SignUp');
            },
            child: Text("Siguiente"),
          )
        ],
      ),
    );
  }
}
