import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'dart:async';
import 'dart:io';

// to add image to storage
import 'package:firebase_storage/firebase_storage.dart';
// for camera
// import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as Path;
// import 'package:path_provider/path_provider.dart';
// to get user details
import 'package:firebase_auth/firebase_auth.dart';
// for firestore
import 'package:cloud_firestore/cloud_firestore.dart';

// getting home dart screen

import 'home.dart';




class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FormScreenState();
}


///  to get form data
class _FormData {
  String item = '';
  String price = '';
  String condition = '';
  String desc = '';
  List imageUrl = [];
  String email = '';
}


class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final fieldText_item = TextEditingController();
  final fieldText_price = TextEditingController();
  final fieldText_desc = TextEditingController();

    _FormData _data = new _FormData();


  final List<String> items = [
    'New',
    'Used (Like New)',
    'Used (Fair)',
  ];
  String? selectedValue;
  XFile? imageFile;
  XFile? imageFile1;
  XFile? imageFile2;
  XFile? imageFile3;

  bool item_added = false;

  // bool? form_btnDisabled;
  // bool? data_added;

  //   @override
  // void initState() {
  //   form_btnDisabled = false;
  //   data_added = false;
  // }


  // ****************************** on form submit send the image to storage *****************

  uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final User _auth = FirebaseAuth.instance.currentUser!;


    // data_added = false;

    //Check Permissions
          if (imageFile != null && imageFile1 != null && imageFile2 !=null && imageFile3 != null){
// getting image file name
            List values = (imageFile!.path).split("/");
// to upload the image and get download ur
            var snapshot = await _firebaseStorage.ref().child('chsam_finalproject/' + values.last).putFile(File(imageFile!.path));
            var downloadUrl = await snapshot.ref.getDownloadURL();
            print("****************** download url ia *****");
            print(downloadUrl);
            _data.imageUrl.add(downloadUrl);

            // image 1
            if(imageFile1 != null){
              List values1 = (imageFile1!.path).split("/");
              var snapshot1 = await _firebaseStorage.ref().child('chsam_finalproject/' + values1.last).putFile(File(imageFile1!.path));
              var downloadUrl1 = await snapshot1.ref.getDownloadURL();
              _data.imageUrl.add(downloadUrl1);
            }

             // image 2
            if(imageFile2 != null){
              List values2 = (imageFile2!.path).split("/");
              var snapshot2 = await _firebaseStorage.ref().child('chsam_finalproject/' + values2.last).putFile(File(imageFile2!.path));
              var downloadUrl2 = await snapshot2.ref.getDownloadURL();
              _data.imageUrl.add(downloadUrl2);
            }

             // image 3
            if(imageFile3 != null){
              List values3 = (imageFile3!.path).split("/");
              var snapshot3 = await _firebaseStorage.ref().child('chsam_finalproject/' + values3.last).putFile(File(imageFile3!.path));
              var downloadUrl3 = await snapshot3.ref.getDownloadURL();
              _data.imageUrl.add(downloadUrl3);
            }

// get use loged in details
          print('************* email is ************');
          // print(_auth.email);
          _data.email = _auth.email!;
// sending data to firestore
          print(" *********** item data is ********** ");
          print(_data.email);
          print(_data.item);
          print(_data.price);
          print(_data.condition);
          print(_data.desc);
          print(_data.imageUrl);
          var db = FirebaseFirestore.instance;
          final item_data = <String, dynamic>{
  "email": _data.email,
  "item": _data.item,
  "price":_data.price,
  "condition":_data.condition,
  "desc":_data.desc,
  "imageUrl":_data.imageUrl
};

// Add a new document with a generated ID
db.collection("chsm_item_data").add(item_data).then((DocumentReference doc) => {
  print("***** doc.id is *******"+ doc.id),

  fieldText_item.clear(),
fieldText_price.clear(),
 fieldText_desc.clear(),

 setState(() {
   imageFile  = null;
   imageFile1 = null;
   imageFile2 = null;
   imageFile3 = null;
   item_added = true;
 }),


});
    // print(" ********* DATA ADDED YES *******************");
    // print(' ********************** DATA ADDED DocumentSnapshot added with ID: ${doc.id}'))

          }else{
            print("no image received");
          }
  }

// ******************************************* Camera Section ********************************************

// image 3
Widget _setImageView3() {
    if (imageFile3 != null) {
      print(" *********************** path is ************************************ " );
      print(imageFile3!.path);
      return Padding(
        padding: EdgeInsets.all(10),
        child: Image.file(File(imageFile3!.path), width: 100, height: 100)
        );
      
    } else {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Please select image !!!!",
        style: TextStyle(
          fontSize: 10,
          color: Colors.red
          ),
        
        ),
      );
      //Text("Please select an image");
    }
  }



// image 2
Widget _setImageView2() {
    if (imageFile2 != null) {
      print(" *********************** path is ************************************ " );
      print(imageFile2!.path);
      return Padding(
        padding: EdgeInsets.all(10),
        child: Image.file(File(imageFile2!.path), width: 100, height: 100)
        );
      
    } else {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Please select image !!!!",
        style: TextStyle(
          fontSize: 10,
          color: Colors.red
          ),
        
        ),
      );
      //Text("Please select an image");
    }
  }

//  image 1
Widget _setImageView1() {
    if (imageFile1 != null) {
      print(" *********************** path is ************************************ " );
      print(imageFile1!.path);
      return Padding(
        padding: EdgeInsets.all(10),
        child: Image.file(File(imageFile1!.path), width: 100, height: 100)
        );
      
    } else {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Please select image !!!!",
        style: TextStyle(
          fontSize: 10,
          color: Colors.red
          ),
        
        ),
      );
      //Text("Please select an image");
    }
  }

//  image 

  Widget _setImageView() {
    if (imageFile != null) {
      print(" *********************** path is ************************************ " );
      print(imageFile!.path);
      return Padding(
        padding: EdgeInsets.all(10),
        child: Image.file(File(imageFile!.path), width: 100, height: 100)
        );
      
    } else {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Please select image !!!!",
        style: TextStyle(
          fontSize: 10,
          color: Colors.red
          ),
        
        ),
      );
      //Text("Please select an image");
    }
  }




// for image 3
void _openGallery3(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile3 = picture;
    });
    Navigator.of(context).pop();
  }

  void _openCamera3(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile3 = picture;
    });
    Navigator.of(context).pop();
  }


  Future<void> _showSelectionDialog3(BuildContext context) {
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
                        _openGallery3(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera3(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }
// img count 2
void _openGallery2(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile2 = picture;
    });
    Navigator.of(context).pop();
  }

  void _openCamera2(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile2 = picture;
    });
    Navigator.of(context).pop();
  }


  Future<void> _showSelectionDialog2(BuildContext context) {
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
                        _openGallery2(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera2(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

// imge 1
  void _openGallery1(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile1 = picture;
    });
    Navigator.of(context).pop();
  }

  void _openCamera1(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile1 = picture;
    });
    Navigator.of(context).pop();
  }


  Future<void> _showSelectionDialog1(BuildContext context) {
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
                        _openGallery1(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera1(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }
// first image
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
  //********************************* Camera Section ********************************* */

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
       
        title: new Text('Sell your Item Here'),
        actions: [
          IconButton(
           icon: const Icon(Icons.person),
           onPressed: () {

            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomeScreen()),
  );

           }),
         
        ],

      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[

                
//  to get item name
                new TextFormField(
                        decoration: new InputDecoration(
                        hintText: 'Chair',
                        labelText: 'Item Name'),
                    validator: (value) { if (value == null || value.isEmpty) { return 'Please enter item name'; } return null;},
                    onChanged: ((value) => {
                      print(" saved value is"),
                      print(value),
                      this._data.item = value,
                    }),
                    controller: fieldText_item
                     ),

//  to get price of the item
                new TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [CurrencyTextInputFormatter()],
                    validator: (value) { if (value == null || value.isEmpty) { return 'Please enter price'; } return null;},
                    onChanged: (value) => { this._data.price = value.substring(3)},
                    controller: fieldText_price,
                    decoration: new InputDecoration(
                        hintText: 'Price',
                        labelText: 'Enter Item Price')),



                if(selectedValue != null) Text('') else Padding(
        padding: EdgeInsets.only(top:10.0, bottom: 5.0),
        child: Text("Please choose the item's condition",
        style: TextStyle(
          fontSize: 15,
          color: Colors.red
          ),
        
        ),
      ), 
                

                // drop down
                new Container(
                  margin: new EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                        // itemPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 333),
                  hint: Text( "Items's Condition", style: TextStyle( fontSize: 14, color: Theme.of(context).hintColor,),),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          )))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  buttonHeight: 40,
                  buttonWidth: 140,
                  itemHeight: 50,
                )
                )
                ),


      
                



// to get description

                  new TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    
                      validator: (value) { if (value == null || value.isEmpty) { return 'Please enter description'; } return null;},
                      onChanged: (value) => {this._data.desc = value},
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 20) ,
                        border: OutlineInputBorder(),
                        hintText: 'Enter item description ',
                      ),
                      controller: fieldText_desc
                      ),

                /// uploading images
                
                new Container(
                  // child: CamScreen(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      new Row(
                        children: [_setImageView(), Spacer(), _setImageView1()],
                      ),
                      new Row(
                        children: [_setImageView2(),Spacer(), _setImageView3()],
                        ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center ,//Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                        children: [
                          ElevatedButton( onPressed: () { _showSelectionDialog(context); }, child: const Icon(Icons.add),),Spacer(),
                           ElevatedButton( onPressed: () { _showSelectionDialog1(context); }, child: const Icon(Icons.add),),Spacer(),
                           ElevatedButton( onPressed: () { _showSelectionDialog2(context); }, child: const Icon(Icons.add),),Spacer(),
                           ElevatedButton( onPressed: () { _showSelectionDialog3(context); }, child: const Icon(Icons.add),),
                          ],
                        )
                        ],),),


                // submit button
                new Container(
                  width: screenSize.width,
                  child: new ElevatedButton(
                    child: new Text(
                      'Add Item',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () =>  {
                      // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate() && selectedValue != null  && imageFile != null && imageFile1 != null && imageFile2 != null && imageFile3 != null) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.

                  this._data.condition = selectedValue!,
                  // this._data.imageUrl = imageFile!.path,



                  print("printing the form data +++++++"),
                  print(this._data.desc),
                  print(this._data.condition),
                  print(this._data.item),
                  print(this._data.imageUrl),
                  print(this._data.price),

                  uploadImage(),
                  ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text(' Processing'))   ,
                  )


                }
                    },
                  ),
                  margin: new EdgeInsets.only(top: 40.0, bottom: 40.0),
                ),

                item_added ? new Container(
                  child : new Text(" Added Item To List Successfully",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green
                  ),
                  )
                ) : new Container(
                  child: new Text(''),
                )



              ],

              
            ),
          )),
    );
  }
}
