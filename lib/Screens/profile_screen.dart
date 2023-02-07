import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/Screens/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  List userdata = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getrecord();
    
  }
  
  Future getrecord() async {
    String uri = "http://192.168.95.109/flutter_app/viewdata.php";
    try {
      var response = await http.get(Uri.parse(uri));

      setState(() {
        userdata = json.decode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }
 
  // List userdata = [];
  // Future<void> getrecord() async {
  //   String uri = "http://192.168.219.109/flutter_app/viewdata.php";
  //   try {
  //     var response = await http.get(Uri.parse(uri));

  //     setState(() {
  //       userdata = jsonDecode(response.body);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getrecord();
  //   super.initState();
  // }

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
        
                // ElevatedButton(
                //  // color: const Color(0xFFFF981A),
                //   onPressed: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => const login(),));
                // },style: ElevatedButton.styleFrom(
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30),),
                //   primary:Color(0xFFFF981A) ),
                // child: const Text("LOGOUT",style: const TextStyle(color: Colors.white,fontSize: 15),),
                // )
                  
              ],
            ),
          ],),
        ),
      ),

     );

  }
}