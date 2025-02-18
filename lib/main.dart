import 'package:flutter/material.dart';
import 'package:tracking_app/src/pages/home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tracking App",
      home: HomePage(),
    );
  }
}