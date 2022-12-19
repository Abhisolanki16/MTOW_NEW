import 'dart:convert';
import 'package:http/http.dart'as http;
import "package:flutter/material.dart";
import 'package:login/navigationbar.dart';
class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {

  TextEditingController full_name = TextEditingController();
  TextEditingController unique_id = TextEditingController();
  TextEditingController mobile_no = TextEditingController();
  TextEditingController pincode = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  Future<void> insertrecord() async { 
    if(full_name.text != "" || unique_id.text != "" || mobile_no.text != "" || pincode.text != ""){
      try{
        String uri = "http://192.168.120.109/flutter_app/insertdata.php";
        var res = await http.post(Uri.parse(uri),
        body: {
          "full_name": full_name.text,
          "unique_id": unique_id.text,
          "mobile_no": mobile_no.text,
          "pincode": pincode.text,
        });
        var response = jsonDecode(res.body);
        if(response["Success"] == true  ){
          print("Record Inserted");
        }else{
          print("Some Issue");
        }
      }catch(e){
        print(e);
      }
    }else{
      print("Please Fill All Fields");

    }
   
  }


  String location = 'MANINAGAR';
  String post = 'PSI';
  var Location = [   
    'MANINAGAR',
    'LAW GARDEN',
    'ELISBRIDGE',
    'NEHRUNAGAR',
    'PALDI',
  ];
  var POST = [   
    'PSI',
    'PI',
    'DCP',
    'ASI',
    'CONSTABLE',
  ];

  


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFF981A),
          title: Text("Create Profile"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20,bottom: 40),
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFFF981A),
                          child: Icon(Icons.person,size: 50,color: Colors.white,),
                          radius: 50),
              ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: full_name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        labelText: 'Full Name',
                        ),
                  ),
                ),
                 Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                  child: TextField(
                    controller: unique_id,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        labelText: 'Unique ID',
                        ),
                  ),
                ),
                 Padding(
                  
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: mobile_no,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        labelText: 'Mobile No / Email',
                        ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                  child: TextField(
                    controller: pincode,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        labelText: 'Pincode',
                    ),
                  ),
                ),
            
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                      child:DropdownButton(
                   
                  // Initial Value
                  value: location,
                   
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),   
                   
                  // Array list of items
                  items: Location.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(), onChanged: (String? value) {  })
                    ),
               // -----------------------------------------------------------------------          
                  Container(
                     padding: EdgeInsets.only(left: 10),
                     decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
            
                      child:DropdownButton(
            
                   
                  // Initial Value
                  value: post,
                   
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),   
                   
                  // Array list of items
                  items: POST.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(), onChanged: (String? value) {  })
                    ),
            
            
            
                  ]),
                ),
                SizedBox(height: 30,),
                  
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Color(0xFFFF981A), borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () {
                      insertrecord();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NavigatioBar()));
                        },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}








