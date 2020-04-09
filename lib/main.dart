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

      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),

      initialRoute: '/',
      routes:{
        '/' :(context) => LogInpage(),
        '/SignUp':(context) => SignUpPage(),
         '/Home':(context) => HomaePage(),
      } ,

    );
  }
}

