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
              //SizedBox(height: 100),
            Column(
              children: [
        
                Container(
                  //alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: height/25),
                  child: const CircleAvatar(
                          backgroundColor: Color(0xFFFF981A),
                          child: Icon(Icons.person,size: 60,color: Colors.white,),
                          radius: 60,
                  ),
                ),
        
                SizedBox(height: height/55,),
        
                 Center(
                  child: user != null ? Text("${user!.fullname}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                  : Text("UserName")
                ),
                 SizedBox(height: height/55,),
        
        
                Center(
                  child: ElevatedButton(
                    onPressed: (() {
                      
                    }),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),),
                      primary: Color(0xFFFF981A),),
                    child: const Text("Edit Profile"),
                  ),
                ),
        
                 SizedBox(height: height/40,),
        
        
                Container(
                    alignment: Alignment.topLeft,
                    color: Colors.amber,
                    padding: EdgeInsets.symmetric(horizontal: width/15),
                    child: 
                    // const TextField(
                    //   decoration: InputDecoration(
                    //       hintText: "ABHI SOLANKI",
                    //       hintStyle: TextStyle(fontWeight: FontWeight.bold)
                    //       ),
                    // ),
                    user != null ? Text("${user!.fullname}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                  : Text("UserName"),
                  
                  ),
        

                  SizedBox(height: height/60,),
        
        
                Container(
                  alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: width/15),
                    child: 
                    // const TextField(
                    //   decoration: InputDecoration(
                    //       hintText: "ASI201910110",
                    //       hintStyle: TextStyle(fontWeight: FontWeight.bold)
                    //       ),
                    // ),
                    user != null ? Text("${user!.phoneNo}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                  : Text("Phone Number")
                  ),
        
                  SizedBox(height: height/60,),
        
        
                Container(
                  alignment: Alignment.topLeft,
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: width/15),
                    child: 
                    // const TextField(
                    //   decoration: InputDecoration(
                    //       hintText: "+91 9912983456",
                    //       hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)
                    //       ),
                    // ),
                    user != null ? Text("${user!.email}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                  : Text("Email")
                  ),
        
                  SizedBox(height: height/60,),
        
        
                Container(
                  alignment: Alignment.topLeft,
                  
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: width/15),
                    child: 
                    // const TextField(
                    //   decoration: InputDecoration(
                    //       hintText: "382443",
                    //       hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)
                    //       ),
                    // ),
                    user != null ? Text("Birth Date",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                  : Text("User ID")
                  ),
        
                  SizedBox(height: height/15,),
        
                ElevatedButton(
                 // color: const Color(0xFFFF981A),
                  onPressed: () async {
                    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                          sharedPreferences.remove(SplashScreenState.KEYLOGIN);
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const login(),));
                },style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),),
                  primary:Color(0xFFFF981A) ),
                child: const Text("LOGOUT",style: const TextStyle(color: Colors.white,fontSize: 15),),
                )
                  
              ],
            ),
          ],),
        ),
      ),

     );
  }
  void initPreferences() async{
    preferences = await SharedPreferences.getInstance();
    setState(() {
      user = User.fromJson(jsonDecode(preferences.getString('userdata')!));
    });
  }

}