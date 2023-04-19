import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile_no = TextEditingController();

  String dropdownvalue = 'ASI'; 

  var items=[
    "ASI",
    "PSI",
    "PI",
    "HEAD CONSTABLE",
    "CONSTABLE"
  ];



  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future<void> CreateUser() async {
    if (username.text != "" ||
        password.text != "" ||
        mobile_no.text != "" ||
        email.text != "" ||
        dropdownvalue !=""
        ) {
      try {
        //String uri = "https://mtow.000webhostapp.com/create_profile.php";
        String uri = "http://192.168.137.1/flutter_app/add_user.php";
        var res = await http.post(Uri.parse(uri), body: {
          "username": username.text,
          "password": password.text,
          "mobile_no": mobile_no.text,
          "email": email.text,
          "designation":dropdownvalue,
        });
        var response = json.decode(res.body);
        if (response["Success"] == true) {
          print("Record Inserted");
        } else {
          print("Some Issue");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please Fill All Fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF981A),
        title: Text("M-Towing"),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formkey,
            child: Column(children: [
              SizedBox(
                height: 70,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Add User",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: username,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter username";
                  } else if (value.length != 10) {
                    return "username must be 10 characters";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  hintText: "Enter Unique ID",
                  labelText: "Unique ID",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: password,
                keyboardType: TextInputType.text,
                obscureText: true,
                obscuringCharacter: "*",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter password";
                  } else if (value.length > 12) {
                    return "password should be not more than 12 characters long";
                  }else if (value.length < 7) {
                    return "minimum 6 characters required";
                  }else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.key),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  hintText: "Enter Password",
                  labelText: "Password",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                      if(value!.isEmpty)
                      {
                        return "Please enter  email";
                      }else if(!value.contains("@")){
                        return "Please enter valid email";
                      }else if(!value.contains(".com")){
                        return "Please enter valid email";
                      }else
                      return null;
                    },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  hintText: "Enter Email",
                  labelText: "Email",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: mobile_no,
                keyboardType: TextInputType.number,
                validator: (value){
                      if(value!.isEmpty)
                      {
                        return "Please enter mobile number";
                      }else if(value.length != 10){
                        return "Mobile number must be 10 digits";
                      }else if(value.contains("0-9")){
                        return "only digits";
                      }else{
                      return null;}
                    },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                   prefixText: '+91 ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  hintText: "Enter Contact No",
                  labelText: "Contact No",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text("Designation",style: TextStyle(fontSize: 18),),
                  ),
                  DropdownButton(
                    //hint: Text('Designation'),
                  // Initial Value
                  value: dropdownvalue,
                    
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),    
                    
                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) { 
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
            ),
                ],
              ),
      
             SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                    onPressed: () {
                      CreateUser();
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
