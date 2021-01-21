
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool _loading = true;
  File _image;
  List _output;
  final picker = ImagePicker();

  pickImage() async{
  var image = await picker.getImage(source: ImageSource.camera);
      if (image == null) return null;

      setState(() {
        _image = File(image.path);
      });
      
      classifyImage(_image);
  }

  pickGalleryImage() async{
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    classifyImage(_image);
  }


  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(path: image.path , numResults: 2, threshold: 0.5, imageMean: 127.5, imageStd: 127.5);
    setState(() {
      _output = output;
      _loading = false;
    });
  }

  Future loadModel() async {
    await Tflite.loadModel(
      model: 'assets/tflite/model_unquant.tflite',
      labels: 'assets/tflite/labels.txt',
    );
  }

  @override
  void initState() {
    loadModel().then((value) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }


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
             width: 150,
             child: Column(children: <Widget>[
               Image.asset('assets/cat.png'),
               SizedBox(height: 50)
             ],)
           ) : Container(
              child: Column(children: <Widget>[
                Container(
                    height: 250 ,
                    child: Image.file(_image)),
                SizedBox(height:20),
                _output != null ? Text('${_output[0]}' , style: TextStyle(color: Colors.white, fontSize: 20)) : Container(),
                SizedBox(height: 10)
              ],)


           ) ),
           Container(
               width: MediaQuery.of(context).size.width,
               child: Column(children: <Widget>[
               GestureDetector(
                 onTap: pickImage,
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
                     onTap: pickGalleryImage,
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
