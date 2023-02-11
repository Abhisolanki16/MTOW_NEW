import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import "package:flutter/material.dart";
import 'package:login/Screens/navigationbar.dart';
import 'package:image_picker/image_picker.dart';




class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {

  TextEditingController full_name_Controller = new TextEditingController();
  TextEditingController unique_id_Controller = new TextEditingController();
  TextEditingController mobile_no_Controller = new TextEditingController();
  TextEditingController pincode_Controller = new TextEditingController();
  bool visible = false ;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _formKey = GlobalKey<FormState>();

  File? imagepath;
  String? imagename;
  String? imagedata;

  ImagePicker imagePicker = new ImagePicker();


  Future<void> getImage() async{
    var getImage = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
    imagepath = File(getImage!.path);
    imagename = getImage.path.split('/').last;
    imagedata = base64Encode(imagepath!.readAsBytesSync());
    print(imagepath); 
    print(imagename);
  
    });
  }


  Future<void> insertrecord() async { 
    if(full_name_Controller.text != "" || unique_id_Controller.text != "" || mobile_no_Controller.text != "" || pincode_Controller.text != ""){
      try{
        String uri = "https://mtow.000webhostapp.com/insertdata.php";
        //String uri = "http://172.16.27.19/flutter_app/insertdata.php";
        var res = await http.post(Uri.parse(uri),
        body: {
          "full_name": full_name_Controller.text,
          "unique_id": unique_id_Controller.text,
          "mobile_no": mobile_no_Controller.text,
          "pincode": pincode_Controller.text,
          "data": imagedata,
          "name": imagename
        });
        var response = json.decode(res.body);
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
     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NavigatioBar()));
   
  }

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
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: Column(
                children: <Widget>[
                imagepath == null 
                ? Container(
                  margin: EdgeInsets.only(top: 20,bottom: 40),
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFFF981A),
                            child: IconButton (
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
                  margin: EdgeInsets.only(top: 20,bottom: 40),
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFFC6600),
                    //child: Image.file(imagepath!),
                    backgroundImage: Image.file(imagepath!).image,
                    radius: 70),
                ),

                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      validator: (value) {
                            if(value == null || value.isEmpty ){
                              return "Please fill all fields";                    
                            }else{
                              return null ;
                            }
                          },
                      controller: full_name_Controller,
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
                    child: TextFormField(
                      validator: (value) {
                            if(value == null || value.isEmpty ){
                              return "Please fill all fields";
                              
                            }else if(value.length < 10){
                              return "Unique id should be at least 10 characters" ;
                            }
                          },
                      controller: unique_id_Controller,
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
                    child: TextFormField(
                      validator: (value) {
                            if(value == null || value.isEmpty ){
                              return "Please fill all fields";
                              
                            }else if(value.length != 10){
                              return "Mobile number must be in 10 digits";
                            }else{
                              return null;
                            }
                          },
                      controller: mobile_no_Controller,
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
                    child: TextFormField(
                      validator: (value) {
                            if(value == null || value.isEmpty ){
                              return "Please fill all fields";
                            }else if (value.length != 6){
                              return "Pincode must be 6 digits" ;
                            }else{
                              return null;
                            }
                          },
                      controller: pincode_Controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          labelText: 'Pincode',
                      ),
                    ),
                  ),
              
                  
                  SizedBox(height: 30,),
                    
                  ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        insertrecord();
                        formKey.currentState!.save();
                      }
                      
                      // setState(() {
                      //   insertrecord();
                      // });
                      
                      //insertrecord();
                     
                        },style: ElevatedButton.styleFrom(
                          
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
}








