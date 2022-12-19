import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  File? imagefile;

  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imagefile = File(pickedFile!.path);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
         body : imagefile != null
                  ? Container(
                      child: Image.file(imagefile!),
                    ) 
          :Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [BoxShadow(color: Colors.blueAccent)]
          ),
          padding: EdgeInsets.all(24),
          child:IconButton(
          icon: Icon(Icons.camera_alt),
          iconSize: 50.0,
          onPressed: () {
            _getFromCamera();
          },
           ) 
         )
        ),
      ),
    );

  }
}