import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';



import 'camera_widget.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FormScreenState();
}

class _FormScreen {
  String email = '';
  String password = '';
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final List<String> items = [
    'New',
    'Used (Like New)',
    'Used (Fair)',
  ];
  String? selectedValue;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sell your Item Here'),
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
                     ),

//  to get price of the item
                new TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [CurrencyTextInputFormatter()],
                    validator: (value) { if (value == null || value.isEmpty) { return 'Please enter price'; } return null;},
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
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 20) ,
                        border: OutlineInputBorder(),
                        hintText: 'Enter item description ',
                      ),
                      ),

                /// uploading images
                
                new Container(
                  child: CamScreen(),

                ),


                // submit button
                new Container(
                  width: screenSize.width,
                  child: new ElevatedButton(
                    child: new Text(
                      'Add Item',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () => {
                      // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate() && selectedValue != null) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  )
                }
                    },
                  ),
                  margin: new EdgeInsets.only(top: 40.0, bottom: 40.0),
                )



              ],
            ),
          )),
    );
  }
}
