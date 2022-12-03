import 'package:flutter/material.dart';
import 'prd_details_strcu.dart';

class PrdDetailsScreen extends StatefulWidget {
  final PrdDetailStruc prdDetail;

  const PrdDetailsScreen({super.key, required this.prdDetail});
  
  @override
  _PrdDetailsScreenState createState() => _PrdDetailsScreenState();
}
class _PrdDetailsScreenState extends State<PrdDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final note = widget.prdDetail;
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
                tag: note.image,
                child: Image.asset('assets/${note.image}'),
              ),
              SizedBox(height: 8),
              Text(
                note.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(note.desc),
              Text(note.condition)
             
            ],
          ),
        ),
      ),
   
    );
  }
}