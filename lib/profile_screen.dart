import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 
  List userdata = [];
  Future<void> getrecord() async {
    String uri = "http://192.168.219.109/flutter_app/viewdata.php";
    try {
      var response = await http.get(Uri.parse(uri));

      setState(() {
        userdata = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getrecord();
    super.initState();
  }
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
        
                const Center(
                  child: Text("ABHI SOLANKI",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                 SizedBox(height: height/40,),
        
        
                Center(
                  child: Container(
                    width: width/1,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: const BorderRadius.all(const Radius.circular(25))
                      ),
                      margin: EdgeInsets.symmetric(horizontal: width/3),
                    child: FlatButton(
                      onPressed: (() {
                        
                      }),
                      child: const Text("Edit Profile"),
                    ),
                  ),
                ),
        
                 SizedBox(height: height/40,),
        
        
                Container(
                
                    padding: EdgeInsets.symmetric(horizontal: width/15),
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: "ABHI SOLANKI",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold)
                          ),
                    ),
                  ),
        
                  SizedBox(height: height/60,),
        
        
                Container(
                    padding: EdgeInsets.symmetric(horizontal: width/15),
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: "ASI201910110",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold)
                          ),
                    ),
                  ),
        
                  SizedBox(height: height/60,),
        
        
                Container(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: width/15),
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: "+91 9912983456",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)
                          ),
                    ),
                  ),
        
                  SizedBox(height: height/60,),
        
        
                Container(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: width/15),
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: "382443",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)
                          ),
                    ),
                  ),
        
                  SizedBox(height: height/15,),
        
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  child: RaisedButton(
                    color: const Color(0xFFFF981A),
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const login(),));
                  },
                  child: const Text("LOGOUT",style: const TextStyle(color: Colors.white),),
                  ),
                )
                  
              ],
            ),
          ],),
        ),
      ),

     );

  }
}