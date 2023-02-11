import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:login/Screens/create_profile.dart';
import 'package:login/Screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/navigationbar.dart';

class tempLogin extends StatefulWidget {
  const tempLogin({Key? key}) : super(key: key);

  @override
  State<tempLogin> createState() => _tempLoginState();
}

class _tempLoginState extends State<tempLogin> {
    
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    late String finalName;

  

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final formKey = GlobalKey<FormState>();

   

    

    Future Login() async {
    var url = "http://192.168.255.109/flutter_app/login.php";
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
      body: SingleChildScrollView(
        child: Form(
          //key: formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: height/3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/logo white.png"),),
                  color: Color(0xFFFC6600),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))
                ),
                child: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.bottomCenter,
                  child: Text("M-TOWING",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
              ),
              Container(
                padding: EdgeInsets.only(top: 35,bottom: 30),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                
              Padding(
                      padding: EdgeInsets.symmetric(horizontal:width/20),
                      child: TextFormField(
                        validator: (value) {
                            if(value == null || value.isEmpty ){
                              return "Please fill all fields";
                              
                            }else{
                              return null ;
                            }
                          },
                        controller: usernameController,
                        decoration: InputDecoration(
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
                      child: TextFormField(
                        validator: (value) {
                            if(value == null || value.isEmpty){
                              return "Please fill all fields";
                            }else if(value.length < 8){
                              return "At least 8 characters required" ;
                            }else {
                              return null;
                            }
                          },
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
                      child: ElevatedButton(  
                      onPressed: () async {
                        
                        //if(formKey.currentState!.validate()){
                          //String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                          Login();
                           final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                          sharedPreferences.setString('username',usernameController.text);
                          
                          // formKey.currentState!.save();
                            //print("submitted");
                           // }
                        //  Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => const CreateProfile()));
                      },  
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFC6600),
                      ),
                      //color: const Color(0xFFFC6600),
                      //textColor: Colors.white,  
                      child: const Text('Login', style: TextStyle(fontSize: 20.0),),
                    ),  
                    
                    )    
                
                
            ],
          ),
        ),
      ),
    );
  }
}