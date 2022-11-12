
import 'package:flutter/material.dart';
import 'package:login/create_profile.dart';
import 'package:login/login_page.dart';
import 'package:login/navbar.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyNavigationBar(),
    );
  }
}
