import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool textScanning = false;

  XFile? imageFile;

  String scannedText = "";

  String location = 'Null, Press Button';
  String street = '';
  String subLocality = '';
  String locality = '';
  String administrative_area = '';
  String Address = '';
  late int postalCode;

  TextEditingController generatedText = TextEditingController();

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];

    Address = '${place.street} , ${place.subLocality} , ${place.locality} , ${place.postalCode} , ${place.country}';
    print(Address);
    street = '${place.street}';
    subLocality = '${place.subLocality}';
    locality = '${place.locality}';
    postalCode = int.parse('${place.postalCode}');
    administrative_area = '${place.administrativeArea}';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    Future<void> insert_np() async {
      try {
        String uri = "https://mtow.000webhostapp.com/scan_screen.php";
        //String uri = "http://192.168.153.109/mtowing_php/scan_screen.php";
        var res = await http.post(Uri.parse(uri),
            body: {
              "registration_no": jsonEncode(scannedText),
              "street" : jsonEncode(street),
              "subLocality" : jsonEncode(subLocality),
              "locality" : jsonEncode(locality),
              "postalCode" : jsonEncode(postalCode),
              "administrative_area" : jsonEncode(administrative_area),
              
              // "number_plate": jsonEncode(scannedText),
              // "address" : jsonEncode(Address),
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
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          //decoration: BoxDecoration(color: Color(0xFFFF5F15),),
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (textScanning) const CircularProgressIndicator(),
              if (!textScanning && imageFile == null)
                Container(
                  width: width / 2,
                  height: height / 4,
                  color: Colors.grey[300],
                ),
              if (imageFile != null)
                Container(
                  width: width / 2,
                  height: height / 4,
                  color: Colors.grey[300]!,
                  child: Image.file(File(imageFile!.path)),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.grey,
                          shadowColor: Colors.grey[400],
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        onPressed: () {
                          getImage(ImageSource.gallery);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.image,
                                size: 30,
                              ),
                              Text(
                                "Gallery",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey[600]),
                              )
                            ],
                          ),
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.grey,
                          shadowColor: Colors.grey[400],
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        onPressed: () {
                          getImage(ImageSource.camera);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: 30,
                              ),
                              Text(
                                "Camera",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey[600]),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Color(0xFFFF7518)),
                onPressed: () async {
                  Position position = await _getGeoLocationPosition();
                  location =
                      'Lat: ${position.latitude} , Long: ${position.longitude}';
                  GetAddressFromLatLong(position);
                },
                icon: Icon(Icons.pin_drop),
                label: Text("Add Location"),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Text(
                  scannedText,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 40, top: 10, right: 40),
                  child: Text(Address, style: TextStyle(fontSize: 15))),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    insert_np();
                  },
                  style: ElevatedButton.styleFrom(primary: Color(0xFFFF7518)),
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occured while scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textDetector();
    RecognisedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = "$scannedText${line.text}";
      }
    }
    textScanning = false;
    setState(() {});
  }

  // @override
  // void initState() {
  //   super.initState();
  // }
}
