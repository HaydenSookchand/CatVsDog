import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101010),
      body: Container(padding: EdgeInsets.symmetric(horizontal: 24),
      child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           SizedBox(height: 50 ),
           Text(
            "Teachable Machines CNN" , style: TextStyle(color: Color(0xFFEEDA28), fontSize: 50)
            ),
         ]
    )));

  }
}
