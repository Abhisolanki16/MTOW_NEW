import 'package:flutter/material.dart';
 

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("M-Towing"),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Container( 
            alignment: Alignment.bottomCenter,
            child: Icon(Icons.list,size: 50),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Icon(Icons.camera_alt,size: 50),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Icon(Icons.person,size: 50),
          ),

        ]),
      ),
    );
  }
}
