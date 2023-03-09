import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Screens/create_profile.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/Screens/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    Future Login() async {
      // if (formKey.currentState!.validate()) {
        String url = "https://mtow.000webhostapp.com/login.php";
        //String url = "http://172.16.27.19/flutter_app/login.php";
        Uri uri = Uri.parse(url);
        var response = await http.post(uri, body: {
          "username": usernameController.text,
          "password": passwordController.text,
        });

        //var pdfText= await json.decode(json.encode(response.databody);
        var data = json.decode(response.body);

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
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => CreateProfile()));
        } else {
          Fluttertoast.showToast(
            msg: "Username & Password Is Invalid !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM_RIGHT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16,
          );
        }
      }
    // }

    return Scaffold(
      body: Container(
        //constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/SCREEN 1-01.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              // key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: height / 3,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please fill all fields";
                        } else {
                          return null;
                        }
                      },
                      controller: usernameController,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30,
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Unique ID',
                        //hintText: 'Enter valid email id as abc@gmail.com'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please fill all fields";
                        } else if (value.length < 8) {
                          return "At least 8 characters required";
                        } else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          size: 30,
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        //hintText: 'Enter valid email id as abc@gmail.com'
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 20),
                    child: ElevatedButton(
                      onPressed: ()  {
                        // ignore: non_constant_identifier_names
                        Login();
                        // SharedPreferences preferences = await SharedPreferences.getInstance();
                        // preferences.setBool(SplashScreenState.KEYLOGIN,true);

                        //  unique_id = preferences.get('unique_id');

                        print("login success");

                        // if(formKey.currentState!.validate()){
                        //   //String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                        //   Login();
                        //    formKey.currentState!.save();
                        //     print("submitted");
                        //     }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFC6600),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 20.0),
                      ),
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
