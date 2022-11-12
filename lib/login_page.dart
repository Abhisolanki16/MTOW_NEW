import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/homepage.dart';
import 'package:http/http.dart' as http;

import 'create_profile.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future register() async{
    
    String Url = "http://192.168.191.109/flutter_app/registration.php";
    Uri url = Uri.parse(Url);
    var response = await http.post(url,body:{
      "username":usernameController.text,
      "password":passwordController.text
    });
    var data = json.decode(response.body);
    if(data == "Error"){
      Fluttertoast.showToast(
        msg: "This is User Already Exit!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }else{
      Fluttertoast.showToast(
        msg: "Registration Successfull!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.black38,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                          width: 200,
                          height: 150,
                          /*decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50.0)),*/
                          child: Image.asset('assets/image1.png')),
                          Container(
                          child: Text("M-Towing",style: TextStyle(fontSize: 30),)),
                          SizedBox(height: 30,)
                    ],
                  ),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              SizedBox(height: 30,),
              FlatButton(
                onPressed: (){

                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,width: 100,
                    color: Colors.blueAccent,
                    child: TextButton(
                      child: Text("Login",style: TextStyle(color: Colors.white)),
                      onPressed: (() {
                        register();
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CreateProfile()));
                    }),
                  )),
                  SizedBox(height: 100 ,),
                  Container(
                    height: 40,width: 100,
                    color: Colors.blueAccent,
                    child: TextButton(
                      child: Text("Register",style: TextStyle(color: Colors.white)),
                      onPressed: (() {
                      
                    }),
                  ))

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}