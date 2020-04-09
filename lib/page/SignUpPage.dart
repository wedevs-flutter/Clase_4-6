import 'package:flutter/material.dart';
import 'package:logic_class_flutter/models/UserModel.dart';
import 'package:toast/toast.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var userController = TextEditingController();
  var emailController = TextEditingController();
  var pass1Controller = TextEditingController();
  var pass2Controller = TextEditingController();
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
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Registro"),
            TextField(
              keyboardType: TextInputType.text,
              controller: userController,
              decoration: InputDecoration(labelText: "usuario"),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(labelText: "email"),
            ),
            TextField(
              controller: pass1Controller,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "contraseña",
                errorText: !sw ? "contraseña invalida" : null,
              ),
            ),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              controller: pass2Controller,
              onChanged: (codescucha){
                setState(() {
                  if(pass1Controller.text.toString().trim() == pass2Controller.text.toString().trim()){
                    sw= true;
                  }else{
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
                UserModel usertmp;
                if(_validate()){
                  usertmp = UserModel(
                    usuario: userController.text.toString().trim(),
                    email: emailController.text.toString().trim(),
                    pass: pass2Controller.text.toString().trim(),
                  );
                  Toast.show("Registro con exito...", context,
                    duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  print("validado");
                  Navigator.of(context).pushNamed('/Home',arguments: usertmp);

                }else{
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

  bool _validate(){
    if(emailController.text.toString().isEmpty){
      return false;
    }
    if(userController.text.toString().isEmpty){
      return false;
    }
    if(pass1Controller.text.toString().isEmpty){
      return false;
    }
    if(pass2Controller.text.toString().isEmpty){
      return false;
    }
    return true;
  }
}
