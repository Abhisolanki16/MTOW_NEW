import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login/Screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => login(),
          ));
    });
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
}
