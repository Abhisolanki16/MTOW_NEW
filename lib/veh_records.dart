import 'package:flutter/material.dart';

class VehicleRecords extends StatefulWidget {
  const VehicleRecords({Key? key}) : super(key: key);

  @override
  State<VehicleRecords> createState() => _VehicleRecordsState();
}

class _VehicleRecordsState extends State<VehicleRecords> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       body : Container(
         //margin: EdgeInsets.symmetric(vertical: 2),
         child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('GJ10MB2022',style: TextStyle(fontSize: 15),),
                subtitle: Text('MANINAGAR',style: TextStyle(fontSize: 10),),
              ),
            );
          },
        ),
       ),
      ),
    );

  }
}