import 'package:flutter/material.dart';

class staffRecords extends StatefulWidget {
  const staffRecords({Key? key}) : super(key: key);

  @override
  State<staffRecords> createState() => _staffRecordsState();
}

class _staffRecordsState extends State<staffRecords> {
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
                title: Text('Pratham Shah',style: TextStyle(fontSize: 15),),
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