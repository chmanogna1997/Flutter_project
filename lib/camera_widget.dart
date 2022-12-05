import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';



class CamScreen extends StatefulWidget {
  @override

  CamScreenState createState() => new CamScreenState();

}

class CamScreenState extends State<CamScreen> {
  XFile? imageFile;

  Widget _buttonRow(){
    return Row(
      children: [
        ElevatedButton(onPressed: () {
           _showSelectionDialog(context);
        }, child: const Icon(Icons.add),)
      ],
    );
  }

  Widget _setImageView() {
    if (imageFile != null) {
      print(" *********************** path is ************************************ " );
      print(imageFile!.path);
      return Padding(
        padding: EdgeInsets.all(20),
        child: Image.file(File(imageFile!.path), width: 200, height: 200)
        );
      
    } else {
      return Padding(
        padding: EdgeInsets.all(20.0),
        child: Text("Please select image !!!!",
        style: TextStyle(
          fontSize: 20,
          color: Colors.red
          ),
        
        ),
      );
      
      
      
      //Text("Please select an image");
    }
  }

  void _openGallery(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  void _openCamera(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }


  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }


  @override
  Widget build(BuildContext context) {
    return
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _setImageView(),

            new Row(
              mainAxisAlignment: MainAxisAlignment.center ,//Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,

              children: [
                ElevatedButton( onPressed: () { _showSelectionDialog(context); }, child: const Icon(Icons.add),),
              ],
            )
          ],
        );
  }
}