
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login/Screens/adminNavbar.dart';
import 'package:login/api.dart';
import 'package:login/Screens/create_profile.dart';
import 'package:login/Screens/login.dart';
import 'package:login/Screens/navigationbar.dart';
import 'package:login/temp.dart';

import 'package:login/Screens/veh_records.dart';
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
      //home: login(),
      home: CreateProfile(),
    );
  }
}

