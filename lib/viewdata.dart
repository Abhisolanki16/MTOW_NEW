import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class viewData extends StatefulWidget {
  const viewData({Key? key}) : super(key: key);

  @override
  State<viewData> createState() => _viewDataState();
}

class _viewDataState extends State<viewData> {

  List userdata = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getrecord();
    
  }
  
  Future getrecord() async {
    String uri = "http://192.168.108.109/flutter_app/viewdata.php";
    try {
      var response = await http.get(Uri.parse(uri));

      setState(() {
        userdata = json.decode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
      body: ListView.builder(
        itemCount: userdata.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("${userdata[index]["full_name"]}",),
              subtitle: Text("${userdata[index]["unique_id"]}"),
            ),
          );
        },
        ),
    );
  }
}