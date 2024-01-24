import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    initPreferences();
    super.initState();
  }
  //String dob = "";
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController formattedDate = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile_no = TextEditingController();
  TextEditingController dob = TextEditingController();

  late SharedPreferences preferences;
  
  // TextEditingController imagePath = TextEditingController();
  // String? email;
  // String? mobile_no;
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile"),
      backgroundColor: Color(0xFFFC6600),
      
      leading: BackButton(onPressed: () {
        Navigator.pop(context);
      },),
      actions: [
        
        // TextButton(onPressed: () {
          
        // }, child: Text("Save",style: TextStyle(color: Colors.white ),)),

        // IconButton(onPressed: () {
          
        // }, icon: Icon(Icons.done))
      ],
      centerTitle:true),
      
      body: SingleChildScrollView(
        child: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/1234.png'),
        fit: BoxFit.cover), 
        ),
        height: height,
        width: width,
        child : Column(
          children: [
            SizedBox(height: height/7,),
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                
              backgroundColor: Color(0xFFFC6600),
              //child: Image.file(imagepath!),
              //backgroundImage: Image.file(File(imagePath!)).image,
              radius: 60,),
            ),
            SizedBox(height: height/40,),
            Column(
              children: [
                // Container(
                //   height: 15,
                //   //color: Colors.red,
                //   alignment: Alignment.topLeft,
                //   padding: EdgeInsets.symmetric(horizontal: 30,),
                //   child: Text("First Name",style : TextStyle(fontSize :13))),

                  Container(
                  //color: Colors.amber,
                  //height: 40,
                   alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: first_name,
                    decoration: InputDecoration(
                      labelText: "First Name"
                    ),)),
              ],
            ),

            SizedBox(height: 10,),
             Column(
              children: [
                // Container(
                //   height: 15,
                //   //color: Colors.red,
                //   alignment: Alignment.topLeft,
                //   padding: EdgeInsets.symmetric(horizontal: 30,),
                //   child: Text("Last Name",style : TextStyle(fontSize :13))),
                  
                Container(
                  //color: Colors.amber,
                  //height: 40,
                   alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: last_name,
                    decoration: InputDecoration(
                    labelText: "Last Name",
                  ),))
              ],
            ),


            SizedBox(height: 10,),
             Column(
              children: [
                // Container(
                //    //color: Colors.red,
                //   height: 15,
                //   alignment: Alignment.topLeft,
                //   padding: EdgeInsets.symmetric(horizontal: 30),
                //   child: Text("Email",style : TextStyle(fontSize :13))),
                Container(
                  // color: Colors.amber,
                  //height: 40,
                   alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                    labelText: "Email",
                  ),))
              ],
            ),
            SizedBox(height: 10,),
             Column(
              children: [
                //  Container(
                //    //color: Colors.red,
                //   height: 15,
                //   alignment: Alignment.topLeft,
                //   padding: EdgeInsets.symmetric(horizontal: 30),
                //   child: Text("Phone",style : TextStyle(fontSize :13))),
                Container(
                   //color: Colors.amber,
                  //height: 40,
                   alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: mobile_no,
                    decoration: InputDecoration(
                    labelText: "Phone ",
                  ),))
              ],
            ), SizedBox(height: 10,),
             Column(
              children: [
                //  Container(
                //    //color: Colors.red,
                //   height: 15,
                //   alignment: Alignment.topLeft,
                //   padding: EdgeInsets.symmetric(horizontal: 30),
                //   child: Text("Birth Date",style : TextStyle(fontSize :13))),
                Container(
                   //color: Colors.amber,
                  //height: 40,
                   alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: dob,
                    decoration: InputDecoration(
                    labelText: "Birth Date",
                  )),)
              ],
            ),
      
            SizedBox(height: 50,),
      
            Container(
              height: 45,
              width: width/1.3,
              child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Color(0xFFFC6600)),
                child: Text("Submit",style: TextStyle(fontSize: 18),),onPressed: () {
              
            },))
            
      
      
          ],
        ),
        
        // 
          ),
      ),
    );
  }
 
  void initPreferences() async{
    preferences = await SharedPreferences.getInstance();
    dob.text = preferences.getString('dob')!;
    email.text = preferences.getString('email')!;
    mobile_no.text = preferences.getString('mobile_no')!;
    first_name.text = preferences.getString('firstname')!;
    last_name.text = preferences.getString('lastname')!;
    imagePath = preferences.getString('image')!;
    
  }
}