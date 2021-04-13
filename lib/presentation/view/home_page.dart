import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKey(),
      body: body,
    );
  }

  Stack get body => Stack(
    children: <Widget>[
      Container(color: Colors.white,),
      Center(child: Text('Homepage'),)
    ],
  );

}