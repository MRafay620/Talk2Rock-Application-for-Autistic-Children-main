import 'package:flutter/material.dart';
import 'package:autism/constants.dart';
import 'package:autism/models/necessity.dart';

class SubCategory extends StatelessWidget {
  final Necessity necessity;

  const SubCategory({Key? key, required this.necessity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: necessity.color,
      appBar: buildAppBar(context),
      body: Text("Hello",
        style: TextStyle(
          fontFamily: dfont,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(144, 94, 150, 1),
      elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back),
        ),
    centerTitle: true,
    title: Text(necessity.category,
      style: TextStyle(
        color: Colors.white,
        fontFamily: dfont,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    ),
      actions: <Widget>[
        SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
