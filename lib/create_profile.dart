import "package:flutter/material.dart";
import 'package:login/homepage.dart';
class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 40),
                    child: CircleAvatar(
                      child: Icon(Icons.person,size: 40,color: Colors.white,),
                      radius: 60),
          ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                    ),
              ),
            ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Unique ID',
                    ),
              ),
            ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile No / Email',
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
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
    );
  }
}