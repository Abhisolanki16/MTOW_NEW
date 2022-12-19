
import 'package:flutter/material.dart';
import 'package:login/adminNavbar.dart';
import 'package:login/login.dart';
import 'package:login/temp.dart';
import 'package:login/viewdata.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}
