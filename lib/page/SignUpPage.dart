import 'package:flutter/material.dart';
import 'package:logic_class_flutter/Data/HelperDB.dart';
import 'package:logic_class_flutter/models/UserModel.dart';
import 'package:toast/toast.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //instanciar la db
  HelperDB db = HelperDB();
  //controladores para los textField
  var userController = TextEditingController();
  var emailController = TextEditingController();
  var pass1Controller = TextEditingController();
  var pass2Controller = TextEditingController();
  // operador booleando para controlar el erro en onchage y manejar la validacion de contraseñas
  bool sw = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 35), //pading simetricos
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Registro"),
            TextField(
              keyboardType: TextInputType
                  .text, // tipo de entrada de datos cambia el teclado
              controller:
                  userController, // controlador que se instancio arriba v;
              decoration: InputDecoration(labelText: "usuario"),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller:
                  emailController, // controlador que se instancio arriba v;
              decoration: InputDecoration(labelText: "email"),
            ),
            TextField(
              controller:
                  pass1Controller, // controlador que se instancio arriba v;
              keyboardType: TextInputType.visiblePassword,
              obscureText: true, //obstruye la contraseña con ****
              decoration: InputDecoration(
                labelText: "contraseña",
                /**
                 * Operador terario similar a un if
                 * condicion ? por verdad: por falso  <= sintaxis
                 * if(condicion){por verdad}esle{por falso}
                 * 
                 * hay similitud verdad
                 */
                errorText: !sw
                    ? "contraseña invalida"
                    : null, //operador ternario para validar el errofocus del textfiel
              ),
            ),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              controller: pass2Controller,
              onChanged: (codescucha) {
                //funcion de escucha del textfiel en tiempo real codescucha es donde se almacena los valores
                setState(() {
                  //metodo setState es para redibujar la pantalla cuando hay un cambio
                  if (pass1Controller.text.toString().trim() ==
                      pass2Controller.text.toString().trim()) {
                    //preguntamos si las contraseñas son iguales
                    sw = true;
                  } else {
                    sw = false;
                  }
                });
              },
              decoration: InputDecoration(
                  labelText: "repita contraseña",
                  errorText: !sw ? "contraseña invalida" : null),
            ),
            RaisedButton(
              onPressed: () {
                UserModel usertmp; //instanciamos nuestro modelUser
                if (_validate()) {
                  //inicializamos el model con los valores de los textfield
                  usertmp = UserModel(
                    usuario: userController.text.toString().trim(),
                    email: emailController.text.toString().trim(),
                    pass: pass2Controller.text.toString().trim(),
                  );
                  //lanzamos un toast
                  Toast.show("Registro con exito...", context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  print("validado");

                  db.insertUser(usertmp);

                  //y nos manda a la siguiente pantalla
                  //Navigator.of(context).pushNamed('/Home',arguments: usertmp);

                } else {
                  Toast.show("error...", context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  print("error..!!");
                }
              },
              child: Text("Registrar"),
            )
          ],
        ),
      ),
    );
  }

  bool _validate() {
    if (emailController.text.toString().isEmpty) {
      return false;
    }
    if (userController.text.toString().isEmpty) {
      return false;
    }
    if (pass1Controller.text.toString().isEmpty) {
      return false;
    }
    if (pass2Controller.text.toString().isEmpty) {
      return false;
    }
    return true;
  }
}
