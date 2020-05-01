import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logic_class_flutter/Data/HelperDB.dart';
import 'package:logic_class_flutter/models/UserModel.dart';
import 'package:toast/toast.dart';

class LogInpage extends StatefulWidget {
  @override
  _LogInpageState createState() => _LogInpageState();
}

class _LogInpageState extends State<LogInpage> {
//controladores de texto
  var emailController = TextEditingController();
  var passController = TextEditingController();

  HelperDB db = HelperDB();
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
            controller: emailController,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: passController,
            decoration: InputDecoration(labelText: "Password"),
          ),
          RaisedButton(
            onPressed: () async {
              String email = emailController.text.toString().trim();
              String pass = passController.text.toString().trim();
                // ? consulta
              List<UserModel> lista = await db.readUserEmailPass(email, pass);
              if (!(email.isEmpty && pass.isEmpty) && lista.length > 0) {

                //lanza el toast
                Toast.show("Exitoso...!$lista", context,
                    duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                //manda a la pantalla /singUp registrada en los routes de main.dart
                Navigator.of(context).pushNamed('/Home',  
                    arguments: UserModel(
                        usuario: "user",
                        email: "bj60@gmail.com",
                        pass: "123456789"));
              } else {
                Toast.show("Usuario y contraseña nulos...!", context,
                    duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              }
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
