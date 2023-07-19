import 'package:blood_donation/project1/add.dart';
import 'package:flutter/material.dart';
import 'project1/home.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo App",
      routes: {
        '/':(context) => HomePage(),
        '/add':(context) => AddUser(),
      },
      initialRoute:'/' ,
    );
  }
}