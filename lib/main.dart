import 'package:flutter/material.dart';
import 'package:logic_class_flutter/page/HomePage.dart';
import 'package:logic_class_flutter/page/LofInPage.dart';
import 'package:logic_class_flutter/page/SignUpPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(primarySwatch: Colors.blueGrey),

      initialRoute: '/', //pantalla que lanzara primero
      routes: {
        //registramos rutas en un map{(clave: valor)} sintaxis

        //manera de uso
        //clave : (de donde= context) (nos mada= la funcion que retorna)( a La vista= la vista que creamos)
        '/': (context) => LogInpage(),
        '/SignUp': (context) => SignUpPage(),
        '/Home': (context) => HomaePage(),
      },
    );
  }
}
