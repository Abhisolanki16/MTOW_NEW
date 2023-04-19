import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/Screens/login.dart';
import 'package:login/Screens/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../UserModel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    initPreferences();
    super.initState();
  }

  late SharedPreferences preferences;
  User? user = null;
  String dob = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                //color: Colors.red,height: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),),
              //SizedBox(height: 100),
              Column(
                children: [
                  Container(
                    //alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: height / 25),
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFFFF981A),
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.white,
                      ),
                      radius: 60,
                    ),
                  ),
                  SizedBox(
                    height: height / 55,
                  ),
                  Center(
                      child: user != null
                          ? Text(
                              "${user!.fullname}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          : Text("UserName")),
                  SizedBox(
                    height: height / 55,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: (() {}),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        primary: Color(0xFFFF981A),
                      ),
                      child: const Text("Edit Profile"),
                    ),
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.deepOrange,
                        ),
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: user != null
                        ? Text(
                            "${user!.fullname}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        : Text("UserName"),
                  ),
                  SizedBox(
                    height: height / 60,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.deepOrange,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: user != null
                          ? Text(
                              "${user!.phoneNo}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          : Text("Phone Number")),
                  SizedBox(
                    height: height / 60,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(border: Border.all(width: 3,color: Colors.deepOrange,),
                    borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child:
                          // const TextField(
                          //   decoration: InputDecoration(
                          //       hintText: "+91 9912983456",
                          //       hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)
                          //       ),
                          // ),
                          user != null
                              ? Text(
                                  "${user!.email}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              : Text("Email")),
                  SizedBox(
                    height: height / 60,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(border: Border.all(width: 3,color: Colors.deepOrange,),
                    borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child:
                          // const TextField(
                          //   decoration: InputDecoration(
                          //       hintText: "382443",
                          //       hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)
                          //       ),
                          // ),
                         Text(
                                  dob,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),),
                            //Text("User ID")),
                  SizedBox(
                    height: height / 15,
                  ),
                  ElevatedButton(
                    // color: const Color(0xFFFF981A),
                    onPressed: () async {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.remove(SplashScreenState.KEYLOGIN);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const login(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        primary: Color(0xFFFF981A)),
                    child: const Text(
                      "LOGOUT",
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initPreferences() async {
    preferences = await SharedPreferences.getInstance();
    preferences.getString('dob');
    setState(() {
      user = User.fromJson(jsonDecode(preferences.getString('userdata')!), 
      dob = preferences.getString('dob')!
      );
    });
  }

  getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  dob = prefs.getString('dob')!;
  return dob;
}
}
