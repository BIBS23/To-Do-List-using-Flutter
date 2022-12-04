import 'package:dot/Home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  
  runApp(MaterialApp(
    title: "Do Task",
    home: Scaffold(
        appBar: AppBar(
      title: Text(
        "Do Task",
        style: TextStyle(color: Colors.white, fontSize: 26),
      ),
    ),
    body: Home(),
    ),
  ));
}
