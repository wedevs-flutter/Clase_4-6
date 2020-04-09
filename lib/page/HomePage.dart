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
    reParams = ModalRoute.of(context).settings.arguments;
    print("#################   Acepted  ##################");
    print(" $reParams");
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
              child: QrImage(
                data: reParams.email,
                version: QrVersions.auto,
                backgroundColor: Colors.white,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${reParams.usuario}"),
                Text("${reParams.email}"),
                RatingBar(
                  itemSize: 30,
                  initialRating: reParams.calficasion.toDouble(),
                  minRating: reParams.calficasion.toDouble(),
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
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
