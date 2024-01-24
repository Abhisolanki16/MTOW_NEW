import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewProfile extends StatefulWidget {
  const NewProfile({Key? key}) : super(key: key);

  @override
  State<NewProfile> createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {

  @override
  void initState() {
    initPreferences();
    super.initState();
  }

  late SharedPreferences preferences;
  String dob = "";
  String first_name = "";
  String last_name = "";
  String? formattedDate;
  String? email;
  String? mobile_no;
  String? username;
  String? imagePath ;
  String? designation;
  User? user = null;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/12345.png'),fit: BoxFit.cover), ),
        height: height,
        width: width,
        child :Column(
          children: [
           
             SizedBox(height: height/7,),
             imagePath == null ?
             CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    
                  backgroundColor: Color(0xFFFC6600),
                  child: IconButton(icon: Icon(Icons.person),iconSize: 50,color: Colors.white,onPressed: () {},),
                  radius: 60,),
                )
              :CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    
                  backgroundColor: Color(0xFFFC6600),
                  //child: Image.file(imagepath!),
                   backgroundImage: Image.file(File(imagePath!)).image,
                  radius: 60,),
                ),
                SizedBox(height: 5,),

                Container(child: Text("${first_name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),

                SizedBox(height: 20,),

                Column(children: [
                  Container(
                    margin: EdgeInsets.only(left: 35,bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text("Unique ID",style: TextStyle(
                      color: Colors.black,),),

                  ),

                  Container(
                    height: height/25,
                    decoration: BoxDecoration(
                    //border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(30),
                    //color: Colors.blue.shade50.withOpacity(0.9)
                    ),
                    margin: EdgeInsets.only(left: 35,right: 30,bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text("${username}",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),)
                ],),

                Column(children: [
                  Container(
                    margin: EdgeInsets.only(left: 35,bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text("Full Name",style: TextStyle(
                      color: Colors.black,),),

                  ),

                  Container(
                    height: height/25,
                    decoration: BoxDecoration(
                    //border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(30),
                    //color: Colors.blue.shade50.withOpacity(0.9)
                    ),
                    margin: EdgeInsets.only(left: 35,right: 30,bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text("${first_name}"+" "+ "${last_name}",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),)
                ],),

                Column(children: [
                  Container(
                    margin: EdgeInsets.only(left: 35,bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text("Email",style: TextStyle(
                      color: Colors.black),),

                  ),

                  Container(
                    height: height/25,
                    decoration: BoxDecoration(
                    //border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(30),
                    //color: Colors.blue.shade50.withOpacity(0.9)
                    ),
                    margin: EdgeInsets.only(left: 35,right: 30,bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text("${email}",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),)
                ],),

                //SizedBox(height: 2,),
                Column(children: [
                  Container(
                    margin: EdgeInsets.only(left: 35,bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text("Mobile No",style: TextStyle(
                      color: Colors.black),),

                  ),

                  Container(
                    height: height/25,
                    decoration: BoxDecoration(
                    //border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(30),
                    //color: Colors.blue.shade50.withOpacity(0.9)
                    ),
                    margin: EdgeInsets.only(left: 35,right: 30,bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text("${mobile_no}",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),)
                ],),

  
                Column(children: [
                  Container(
                    margin: EdgeInsets.only(left: 35,bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text("Designation",style: TextStyle(
                      color: Colors.black,),),

                  ),

                  Container(
                    height: height/25,
                    decoration: BoxDecoration(
                    //border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(30),
                    //color: Colors.blue.shade50.withOpacity(0.9)
                    ),
                    margin: EdgeInsets.only(left: 35,right: 30),
                    alignment: Alignment.topLeft,
                    child: Text("${designation}",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),)
                ],)

                


          ],
        ), 
      ),
    );
  }
  void initPreferences() async {
    preferences = await SharedPreferences.getInstance();
    preferences.getString('dob');
    email = preferences.getString('email');
    mobile_no = preferences.getString('mobile_no');
    first_name = preferences.getString('firstname')!;
    last_name = preferences.getString('lastname')!;
    imagePath = preferences.getString('image')!;
    username = preferences.getString('username');
    designation = preferences.getString('designation');


    setState(() {
      
      user = User.fromJson(jsonDecode(preferences.getString('userdata')!), 
      dob = preferences.getString('dob')!, 

      );
    });
  }

  getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  dob = prefs.getString('dob')!;
  return dob;}
}