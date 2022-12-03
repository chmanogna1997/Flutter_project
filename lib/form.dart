import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

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

                new TextFormField(
                    decoration: new InputDecoration(
                        hintText: 'Chair',
                        labelText: 'Item Name')),


                new TextFormField(
                    decoration: new InputDecoration(
                        hintText: 'Price',
                        labelText: 'Enter Item Price')),

              

                // drop down
                new Container(
                  margin: new EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                        // itemPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 333),
                  hint: Text(
                    "Items's Condition",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
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
                ))),


                  new Container(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 20),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter item description ',
                      ),
                    ),
                  ),

                ),


                // submit button
                new Container(
                  width: screenSize.width,
                  child: new ElevatedButton(
                    child: new Text(
                      'Login',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () => null,
                  ),
                  margin: new EdgeInsets.only(top: 40.0, bottom: 40.0),
                )
              ],
            ),
          )),
    );
  }
}
