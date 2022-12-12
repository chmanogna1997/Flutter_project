import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'firebase_options.dart';



// (codelab user): Get API key
const clientId = '40343468216-ec19v8fco87kn59uafcfjs4bsgfq7n9m.apps.googleusercontent.com';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
// initalizing firebase and adding my appname
 await Firebase.initializeApp(
   name: 'final_prj_chsm',
   options: DefaultFirebaseOptions.currentPlatform,
 );


 runApp(const MyApp());
}