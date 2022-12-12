import 'package:flutter/material.dart';
import 'prd_details_strcu.dart';

class PrdDetailsScreen extends StatefulWidget {
  final List imageUrl;
  final String item;
  final String price;
  final String condition;
  final String email;
  

  const PrdDetailsScreen({super.key, required this.imageUrl,  required this.item , required this.price, required this.condition, required this.email});
  
  @override
  _PrdDetailsScreenState createState() => _PrdDetailsScreenState();
}
class _PrdDetailsScreenState extends State<PrdDetailsScreen> {

  int index = 0;
  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.imageUrl;
    final item = widget.item;
    final price = widget.price;
    final condition = widget.condition;
    final email = widget.email;
    String dollar_symbol = "\$ ";

  

    print("hello length is >>>>>");
    print(imageUrl.length);
    print("index is::");
    print(index);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Hero(
                tag: imageUrl[index],
                child: Image.network(imageUrl[index],
                    fit: BoxFit.fitWidth,
                    scale: 0.5,
                    height: 500,
                    width: 400,

                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(onPressed:() {
                    print("in previous");
                    if(index == 0){
                      setState(() {
                        index = imageUrl.length -1;
                      });
                    }
                    else{
                      setState(() {
                        index = index-1;
                      });
                    }
                    print("index is");
                    print(index);
                  }, child: Text('<< prev')),
                  Spacer(),
                  ElevatedButton(onPressed:() {
                    if(index == imageUrl.length -1){
                      setState(() {
                        index = 0;
                      });
                      // index = 0;
                    }else{
                      setState(() {
                        index = index + 1;
                      });
                      // index = index + 1;
                    }
                  }, child: Text('next >>'))
                  
                ],
              ),
              Text(
                item,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40
                ),
              ),
              Text(dollar_symbol + ' ' + price,
              style: TextStyle(
                fontSize: 30
              ),
              
              ),
              Text(condition,
                style: TextStyle(
                fontSize: 30
              ),
              ),

               Text('contact:  '+ email,
                style: TextStyle(
                fontSize: 30
              ),
              )
             
            ],
          ),
        ),
      ),
   
    );
  }
}