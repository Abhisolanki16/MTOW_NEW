import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:login/Screens/login.dart';
import 'package:login/add_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class templogin extends StatefulWidget {
  //const templogin({Key? key}) : super(key: key);
 List<String> data=[];
  @override
  State<templogin> createState() => _temploginState();
}

class _temploginState extends State<templogin> {

  List userdata = [];
  int? u_id;
  int id=0;

  @override
  Widget build(BuildContext context) {
  
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  // Future getrecord() async {
  //   String uri = "http://192.168.106.109/flutter_app/test2.php";
  //   try {
  //     var response = await http.post(Uri.parse(uri),body: {
  //       "username": username.text,
  //       "password": password.text,
  //     });
  //     var data = json.decode(response.body);
  //     if(data == "Success"){
  //       print("done");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
   
    Future Login() async {
      // if (formKey.currentState!.validate()) {
        //var url = Uri.http("192.168.60.109", '/flutter_app/login.php', {'q': '{http}'});
        String url = "http://192.168.51.109/flutter_app/123.php";
        //String url = "http://192.168.143.109/flutter_app/login.php";
        Uri uri = Uri.parse(url);
        var response = await http.post(uri, body: {
          "username": username.text,
          "password": password.text,
        });
        setState(() {
           widget.data=json.decode(response.body);
        });
        //var pdfText= await json.decode(json.encode(response.databody);
        
        if (widget.data.toString() == "Error") {
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'Username and password invalid',
        toastLength: Toast.LENGTH_SHORT,
      );
      /*Navigator.of(context).push(MaterialPageRoute(builder: (context)=>home(widget.id)));*/

    } else {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddUser(),));
     // SharedPreferences preferences=await SharedPreferences.getInstance();
      //setState(() {

        
        //preferences.setString('id', data['u_id']);
        //preferences.setString('username', data['username']);
    
        //print("ok");
        
      //});
      
      
    }
      }
      
   return Scaffold(
    body: SafeArea(
      child: Column(children: [
        TextField(
              controller: username,
              decoration: InputDecoration(
              
            ),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
              
            ),
            ),
            ElevatedButton(onPressed: () {
              Login();
              //getid();
            }, child: Text("ok")),
            SizedBox(height: 30,),
            TextField(
              controller: email,
              decoration: InputDecoration(
              
            ),
            ),
            ElevatedButton(onPressed: () {
              
            }, child: Text("${id}")),
            //Text("${id}"),
      ]),
    ),
   ); 
  }
}