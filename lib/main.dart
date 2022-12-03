import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'firebase_options.dart';



// TODO(codelab user): Get API key
const clientId = 'YOUR_CLIENT_ID';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
// initalizing firebase and adding my appname
 await Firebase.initializeApp(
   name: 'final_prj_chsm',
   options: DefaultFirebaseOptions.currentPlatform,
 );


 runApp(const MyApp());
}