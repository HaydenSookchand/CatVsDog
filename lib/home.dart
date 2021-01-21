import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool _loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101010),
      body: Container(padding: EdgeInsets.symmetric(horizontal: 24),
      child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           SizedBox(height: 85 ),
           Text(
            "Teachable Machines CNN" , style: TextStyle(color: Color(0xFFEEDA28), fontSize: 20)
            ),
           SizedBox(height: 6),
           Text("Detect Dogs and Carts" , style: TextStyle(color: Color(0xFFE99600), fontWeight: FontWeight.w500, fontSize: 28)),
           SizedBox(height: 40),
           Center(child: _loading ? Container(
             width: 250,
             child: Column(children: <Widget>[
               Image.asset('assets/cat.png'),
               SizedBox(height: 50)
             ],)
           ) : Container() ),
           Container(
               width: MediaQuery.of(context).size.width,
               child: Column(children: <Widget>[
               GestureDetector(
                 onTap: () {},
                 child: Container(
                     width: MediaQuery.of(context).size.width - 150,
                     alignment: Alignment.center,
                     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                     decoration: BoxDecoration(
                         color:Color(0xFFE99600) ,
                         borderRadius: BorderRadius.circular(6)
                     ),
                     child: Text('Take a photo' , style: TextStyle(color: Colors.white))
                 )
             ),
                 SizedBox(height:20),
                 GestureDetector(
                     onTap: () {},
                     child: Container(
                         width: MediaQuery.of(context).size.width - 150,
                         alignment: Alignment.center,
                         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                         decoration: BoxDecoration(
                             color:Color(0xFFE99600) ,
                             borderRadius: BorderRadius.circular(6)
                         ),
                         child: Text('Camera Roll' , style: TextStyle(color: Colors.white))
                     )
                 ),
           ])
           )
         ]
    )));

  }
}
