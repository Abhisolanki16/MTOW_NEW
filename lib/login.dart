import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login/create_profile.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;


    //final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;

     TextEditingController usernameController = TextEditingController();
     TextEditingController passwordController = TextEditingController();

    Future Login() async {
    String url = "http://192.168.120.109/flutter_app/login.php";
    Uri uri = Uri.parse(url);
    var response = await http.post(uri,
     body: {
      "username": usernameController.text,
      "password": passwordController.text,
    });

    //var pdfText= await json.decode(json.encode(response.databody);
    var data =  json.decode(response.body);


    if (data == "Success") {
      Fluttertoast.showToast(
        msg: "Login Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_LEFT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateProfile(),));
    }else{
      Fluttertoast.showToast(
        msg: "Username & Password Is Invalid !",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16,);

    }
  }

  

   return Scaffold(
        body: SafeArea(
          child: Container(
            //constraints: BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/SCREEN 1-01.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: 
                   [
                     SizedBox(height: height/3,),
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      ),
                      
                      SizedBox(height: height/30,),
                      
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal:width/20),
                    child: TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person,size: 30,),
                          border: OutlineInputBorder(),
                          labelText: 'Unique ID',
                          //hintText: 'Enter valid email id as abc@gmail.com'
                          ),
                    ),
                  ),
                      
                  SizedBox(height: height/30,),
                      
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: width/20),
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.lock,size: 30,),
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          //hintText: 'Enter valid email id as abc@gmail.com'
                          ),
                    ),
                  ),
                      
                  Padding(
                      
                    padding: EdgeInsets.only(top: height/20),
                    child: FlatButton(  
                    onPressed: () {
                      Login();
                      //  Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => const CreateProfile()));
                    },  
                    color: const Color(0xFFFA7618),
                    textColor: Colors.white,  
                    child: const Text('Login', style: TextStyle(fontSize: 20.0),),
                  ),  
                  )               
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
  }