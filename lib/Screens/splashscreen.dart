import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Screens/create_profile.dart';
import 'package:login/Screens/login.dart';
import 'package:login/Screens/navigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}


class SplashScreenState extends State<SplashScreen> {

  static const String KEYLOGIN = "login";

  @override
  void initState() {
    whereToGo();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.deepOrange,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [

            SizedBox(height: height/4.5,),
            
            Container(
              height: height / 4.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/logo white.png"),)),
            ),

            SizedBox(height: 40,),
            //Image(image: AssetImage("assets/logo white.png"),),
              
            Text(
                "M TOWING",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            
            SizedBox(height: 50,),

            CircularProgressIndicator(
              backgroundColor: Colors.white70,
              color: Colors.deepOrange,
              
            )
            
          ],
        ),
      ),
    );
  }
 

  void whereToGo() async{
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 3), () {

      if(isLoggedIn != null){
        if(isLoggedIn){
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NavigatioBar(),
          ));
        }else{
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => login(),
          ));
        }
      }else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => login(),
          ));
      }

    });
  }
}
