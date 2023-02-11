import 'dart:convert';
 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'location.dart';
 
class Pincode extends StatefulWidget {
  const Pincode({super.key, required this.title});
 
  final String title;
 
  @override
  State<Pincode> createState() => _PincodeState();
}
 
class _PincodeState extends State<Pincode> {
  List<Location> locations = [];
  String status = '';

  _getLocations(pincode) {
    setState(() {
      status = 'Please wait...';
    });
    final JsonDecoder _decoder = const JsonDecoder();
    http
        .get(Uri.parse("http://www.postalpincode.in/api/pincode/$pincode"))
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
 
      if (statusCode < 200 || statusCode > 400) {
        throw Exception("Error while fetching data");
      }
 
      setState(() {
        var json = _decoder.convert(res);
        var tmp = json['PostOffice'] as List;
        locations =
            tmp.map<Location>((json) => Location.fromJson(json)).toList();
        status = 'All Locations at Pincode ' + pincode;
      });
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              key: GlobalKey<FormState>(),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                labelText: "Pincode",
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
              onFieldSubmitted: (val) => _getLocations(val),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(status,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: locations.length,
                itemBuilder: (BuildContext context, int index) {
                  final Location location = locations.elementAt(index);
 
                  return Card(
                    child: ListTile(
                      title: Text(location.name),
                      subtitle: 
                      // Text('District: ' +
                      //     location.district +
                      //     '\nArea: '+ location.name+
                  
                      //     '\nState: ' +
                      //     location.state
                      //     ),
                      Text(
                        location.name +' '+location.district+' '+location.state
                      )
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}