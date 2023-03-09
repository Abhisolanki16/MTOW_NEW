import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import "package:flutter/material.dart";
import 'package:login/Screens/navigationbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Screens/profile_screen.dart';
import 'package:login/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  TextEditingController full_name_Controller = new TextEditingController();
  //TextEditingController email = new TextEditingController();
  TextEditingController mobile_no_Controller = new TextEditingController();
  //TextEditingController pincode_Controller = new TextEditingController();
  TextEditingController email_Controller = new TextEditingController();

  late SharedPreferences preferences;

  TextEditingController dateInput = TextEditingController();

  bool visible = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _formKey = GlobalKey<FormState>();

  File? imagepath;
  String? imagename;
  String? imagedata;

  String? gender;
  String fname = "";

  ImagePicker imagePicker = new ImagePicker();

  Future<void> getImage() async {
    var getImage = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagepath = File(getImage!.path);
      imagename = getImage.path.split('/').last;
      imagedata = base64Encode(imagepath!.readAsBytesSync());
      print(imagepath);
      print(imagename);
    });
  }

  // Future<void> insertrecord() async {
  //   if (full_name_Controller.text != "" ||
  //       unique_id_Controller.text != "" ||
  //       mobile_no_Controller.text != "" ||
  //       pincode_Controller.text != "") {
  //     try {
  //       String uri = "https://mtow.000webhostapp.com/insertdata.php";
  //       //String uri = "http://172.16.27.19/flutter_app/insertdata.php";
  //       var res = await http.post(Uri.parse(uri), body: {
  //         "full_name": full_name_Controller.text,
  //         "unique_id": unique_id_Controller.text,
  //         "mobile_no": mobile_no_Controller.text,
  //         "pincode": pincode_Controller.text,
  //         "data": imagedata,
  //         "name": imagename
  //       });
  //       var response = json.decode(res.body);
  //       if (response["Success"] == true) {
  //         print("Record Inserted");
  //       } else {
  //         print("Some Issue");
  //       }
  //       SharedPreferences preferences  = await SharedPreferences.getInstance();
  //       preferences.setString('full_name', full_name_Controller.text);
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else {
  //     print("Please Fill All Fields");
  //   }
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => const NavigatioBar()));
  // }

  Future<void> insertrecord() async {
    if (full_name_Controller.text != "" ||
        email_Controller.text != "" ||
        mobile_no_Controller.text != "" ||
        dateInput.text != "") {
      try {
        //String uri = "https://mtow.000webhostapp.com/insertdata.php";
        String uri = "http://192.168.3.109/flutter_app/upload_data.php";
        var res = await http.post(Uri.parse(uri), body: {
          "full_name": full_name_Controller.text,
          "mobile_no": mobile_no_Controller.text,
          "email": email_Controller.text,
          "dob": dateInput.text,
          "data": imagedata,
          "name": imagename
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NavigatioBar()));
  }

  @override
  void initState() {
    dateInput.text = ""; 
    //set the initial value of text field
    initPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(0xFFFF981A),
        //   title: Text("Create Profile"),
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 50, bottom: 40),
                    child: Text(
                      "Create Profile",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  imagepath == null
                      ? Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: CircleAvatar(
                              backgroundColor: Color(0xFFFF981A),
                              child: IconButton(
                                icon: Icon(Icons.person),
                                onPressed: () {
                                  getImage();
                                },
                                color: Colors.white,
                                iconSize: 40,
                              ),
                              radius: 50),
                        )
                      : Container(
                          margin: EdgeInsets.only(bottom:20),
                          child: CircleAvatar(
                              backgroundColor: Color(0xFFFC6600),
                              //child: Image.file(imagepath!),
                              backgroundImage: Image.file(imagepath!).image,
                              radius: 70),
                        ),

                  Container(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please fill all fields";
                        } else {
                          return null;
                        }
                      },
                      controller: full_name_Controller,
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(30))
                          // ),
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.person_outline)),
                    ),
                  ),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please fill all fields";
                        } else if (value.length < 10) {
                          return "Mobile No should be at least 10 characters";
                        }
                      },
                      controller: mobile_no_Controller,
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(30))
                          // ),
                          labelText: 'Phone Number',
                          prefixIcon: Icon(Icons.local_phone_outlined)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter valid email address...";
                        } else {
                          return null;
                        }
                      },
                      controller: email_Controller,
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(30))
                          // ),
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select birth date first...";
                        } else {
                          return null;
                        }
                      },
                      controller: dateInput,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(30))),
                        labelText: 'Birth Date',
                        prefixIcon: Icon(Icons.date_range_sharp),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2050));

                        if (pickedDate != null) {
                          // print(
                          //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            dateInput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                      readOnly: true,
                    ),
                  ),

                  // Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                  //   child: TextFormField(
                  //     validator: (value) {
                  //           if(value == null || value.isEmpty ){
                  //             return "Please fill all fields";
                  //           }else if (value.length != 6){
                  //             return "Pincode must be 6 digits" ;
                  //           }else{
                  //             return null;
                  //           }
                  //         },
                  //     controller: pincode_Controller,
                  //     decoration: InputDecoration(
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(30))
                  //         ),
                  //         labelText: 'Pincode',
                  //     ),
                  //   ),
                  // ),
                  

                  SizedBox(
                    height: 30,
                  ),

                  ElevatedButton(
                    onPressed: () async{
                      insertrecord();
                      addData();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 10),
                      primary: Color(0xFFFC6600),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(7),
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
      ),
    );
  }
  void addData() async{
    final User user = User(userId: DateTime.now().millisecondsSinceEpoch.toString(), fullname: full_name_Controller.text, email: email_Controller.text, phoneNo: mobile_no_Controller.text);
    String jsonString = jsonEncode(user);
    preferences.setString('userdata', jsonString);
    preferences.setBool('isLogin', true);

  }
  void initPreferences() async{
    preferences = await SharedPreferences.getInstance();
  }
}
