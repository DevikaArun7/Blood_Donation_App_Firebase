import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Blood Donation App") ,
        backgroundColor: Colors.red,
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/add');
        },
         backgroundColor: Colors.red,
         child: Icon(Icons.add,
         size: 30,
         ),
        ) ,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}