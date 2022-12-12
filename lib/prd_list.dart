import 'package:flutter/material.dart';
import 'prd_details.dart';

import 'prd_details_strcu.dart';
import 'form.dart';

// getting home dart screen
import 'home.dart';
// for firestore
import 'package:cloud_firestore/cloud_firestore.dart';



 class PrdListScreen extends StatefulWidget {
  const PrdListScreen({super.key});
  @override
  _PrdListScreenState createState() => _PrdListScreenState();
}
class _PrdListScreenState extends State<PrdListScreen> {
  CollectionReference _reference = FirebaseFirestore.instance.collection('chsm_item_data');
  late Stream<QuerySnapshot> _stream_data;

  String dollar_symbol = "\$ ";
  @override
  void initState() {
    // implement initState
    super.initState();
    _stream_data = _reference.snapshots();
  }
  


  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Let's Shop!!!!"),
         actions: [
          IconButton(
           icon: const Icon(Icons.person),
           onPressed: () {

            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomeScreen()),
  );}),
         ],
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: _stream_data ,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasError){
            return Center( child : Text(snapshot.error.toString()));
          }
          if(snapshot.connectionState == ConnectionState.active){
           QuerySnapshot querySnapshot = snapshot.data;
           List<QueryDocumentSnapshot> documents = querySnapshot.docs;

           List<Map> _prdList = documents.map((e) =>
            {
              'id': e.id,
              'item': e['item'],
              'price': e['price'],
              'condition': e['condition'],
              'desc': e['desc'],
              'email': e['email'],
              'image':e['imageUrl']
            }).toList();


            return ListView.builder(
          itemCount: _prdList.length,
          itemBuilder: (context, index) {
            Map note= _prdList[index];

            // ignore: unused_local_variable
            var itemPrice = dollar_symbol + note['price'].toString();
            return ListTile(
              minVerticalPadding: 24,
              leading: Hero(
                tag: '${note['image'][0]}',
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: Image.network(note['image'][0]).image,
                ),
              ),
              title: Text(
                '${note['item']}',
              ),
              trailing: Text(itemPrice),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PrdDetailsScreen(imageUrl: note['image'], item: note['item'], price: note['price'], condition: note['condition'], email: note['email'],),
                  ),
                );
              },
              
            );
            SizedBox(width: 50);// give it width

            

          });
          }

          return Center(child: CircularProgressIndicator());
        } ,
      ),


 floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed  navigates to form screen(form.dart page)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
     );
  }
}