import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:logic_class_flutter/models/UserModel.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomaePage extends StatefulWidget {
  @override
  _HomaePageState createState() => _HomaePageState();
}

class _HomaePageState extends State<HomaePage> {
  UserModel reParams;
  
  @override
  Widget build(BuildContext context) {
    reParams = ModalRoute.of(context).settings.arguments; // manera de recibir los valores enviados de la vista SignUpPage
    print("#################   Acepted  ##################");
    print(" $reParams"); //imprimimos los valores
    print("################################################");
    
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      child: Column(
        children: <Widget>[
          _item(),
        ],
      ),
    );
  }

  Widget _item() {
    return Container(
      color: Colors.red,
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
              child: QrImage( //widget QR de la dependencia
                data: reParams.email, // valor que se codificara (String)
                version: QrVersions.auto, //varsion a usarse
                backgroundColor: Colors.white, //color de fondo
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${reParams.usuario}"),
                Text("${reParams.email}"),
                // manera de utilizar el ratingBar
                RatingBar(
                  itemSize: 30, // tamaño de los iconos
                  initialRating: reParams.calficasion.toDouble(), //valor inicial de las estrellitas pintadas
                  minRating: reParams.calficasion.toDouble(), // valor minimo de estrellitas a pintar
                  direction: Axis.horizontal, //eje de desplazamiento de los Icons
                  allowHalfRating: true, // true = habilitar valores 3.5(***[media estrella pintada]) or False = habilitar solo enteros ej. 3(***)
                  itemCount: 5, //Nro de los iconos a generar 
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0), //padding entre iconos
                  itemBuilder: (context, _) => Icon( //metodo que contruye las estrellotas
                    Icons.star, //icono a crearse en este ejemplo estrella
                    color: Colors.amber, // color de icono
                  ),
                  onRatingUpdate: (rating) {// Funcion escucha de rating
                    print(rating); // la variable rating retorna los valores del rating
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
