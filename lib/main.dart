
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login/Screens/adminNavbar.dart';
import 'package:login/Screens/frgtpswd.dart';
import 'package:login/Screens/profile_screen.dart';
import 'package:login/Screens/scan_screen.dart';
import 'package:login/Screens/splashscreen.dart';
import 'package:login/Screens/create_profile.dart';
import 'package:login/Screens/login.dart';
import 'package:login/Screens/navigationbar.dart';
import 'package:login/abc.dart';
import 'package:login/add_user.dart';
import 'package:login/curvedNavbar.dart';
import 'package:login/pincode.dart';

import 'package:login/Screens/veh_records.dart';
import 'package:login/viewdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   var unique_id = preferences.get('unique_id');
//   runApp(MaterialApp(home: unique_id == null ? login() : NavigatioBar(),));

// }
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      //theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      //home: ScanScreen(),
      home: CreateProfile () 
      //Pincode(title: "pincode app"),
    );
  }
}

