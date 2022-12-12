import 'package:complete/auth_gate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class HomeScreen extends StatelessWidget {
 const HomeScreen({super.key});



 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading: BackButton(
          color: Colors.white,
          onPressed: () {
          Navigator.pop(context);
        },),
      title: new Text('lets signout'),

       actions: [
         IconButton(
           icon: const Icon(Icons.person),
           onPressed: () {
             Navigator.push(
               context,
               MaterialPageRoute<ProfileScreen>(
                 builder: (context) => ProfileScreen(
                   appBar: AppBar(
                     title: const Text('User Profile'),
                   ),
                   actions: [
                     SignedOutAction((context) {
                       Navigator.of(context).pop();
                     })
                   ],
                   children: [
                     const Divider(),
                     Padding(
                       padding: const EdgeInsets.all(2),
                       child: AspectRatio(
                         aspectRatio: 1,
                         child: Image.asset('assets/garagesale.jpeg'),
                       ),
                     ),
                   ],
                 ),
               ),
             );
           },
         )
       ],
       automaticallyImplyLeading: false,
     ),
     body: Center(
       child: Column(
         children: [
           Image.asset('assets/dash.png'),
           Text(
             'Welcome!',
             style: Theme.of(context).textTheme.displaySmall,
           ),
           ElevatedButton(onPressed:() {
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AuthGate()),
  );

  FirebaseAuth.instance.signOut();

           }, child: Text('sign out'))
         ],
       ),
     ),
   );
 }
}