// import 'package:flutter/material.dart';
// import 'prd_details.dart';

// // import 'prd_details_strcu.dart';
// import 'form.dart';

// // getting home dart screen
// import 'home.dart';

// // for firestore
// import 'package:cloud_firestore/cloud_firestore.dart';

// class PrdListScreen extends StatelessWidget {
//   PrdListScreen({Key? key}) : super(key: key);


//     List _prdList = [
//     // PrdDetailStruc(
//     //     title: 'Ball',
//     //     price: 10,
//     //     image: "dash.png",
//     //     desc: "Ball nothing great nothing great 10",
//     //     condition: "good",
//     //     email: "bbb"
//     //     ),
//   ];

//   // getting data from firebase
//   CollectionReference _data =
//     FirebaseFirestore.instance.collection("chsm_item_data");

//   Future<void> getData() async {
//     // Get docs from collection reference
//     QuerySnapshot querySnapshot = await _data.get();
    

//     // Get data from docs and convert map to List
//     final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

//     // print(allData);

//     // _prdList = allData;
//     print(""""""""""""" >>>>>>>>>>> printing _prdList <<<<<<<<<<<<<<< """"""""""""""""""");
//     //print(_prdList);

//     for (int i = 0; i < allData.length; i++) {
//       print(allData[i]);
//       print("kkkkkkkkkkkkjhjghjfhgfggfdddg");
      

    

//       print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%");

//     }

    
// }

//   String dollar_symbol = "\$ ";

//   @override
//   Widget build(BuildContext context) {
//     getData();
//     print(" *************** inside the widget below is _prdlist ***********");
//     print(_prdList);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Let's Shop!!!!"),
//          actions: [
//           IconButton(
//            icon: const Icon(Icons.person),
//            onPressed: () {

//             Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const HomeScreen()),
//   );

//            }),
         
//         ],
//       ),
//       body: ListView.builder(
//           itemCount: _prdList.length,
//           itemBuilder: (context, index) {
//             final note = _prdList[index];
//             print("itemcount is  index >>>>>>>>>>>");
//             print(index);
//             print(_prdList[index]);
//             // ignore: unused_local_variable
//             var itemPrice = dollar_symbol + _prdList[index].price.toString();
//             return ListTile(
//               minVerticalPadding: 24,
//               leading: Hero(
//                 tag: note.image,
//                 child: CircleAvatar(
//                   radius: 40,
//                   backgroundImage: Image.asset('assets/${note.image}').image,
//                 ),
//               ),
//               title: Text(
//                 _prdList[index].title,
//               ),
//               trailing: Text(itemPrice),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         PrdDetailsScreen(prdDetail: _prdList[index]),
//                   ),
//                 );
//               },
              
//             );
//             // SizedBox(width: 50);// give it width

            

//           }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Add your onPressed  navigates to form screen(form.dart page)
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => FormScreen()),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
