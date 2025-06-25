import 'package:easy_travel/firebase_options.dart';
import 'package:easy_travel/loadingscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
runApp(Myapp());

}class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
     title: "Easy Travel",
     home:loadingscreen(),
     theme: ThemeData(
              brightness: Brightness.light
            ),

     );


  }
}