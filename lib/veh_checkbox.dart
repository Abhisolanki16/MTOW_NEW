import 'package:flutter/material.dart';

class VehicleCheckBox extends StatefulWidget {
  const VehicleCheckBox({Key? key}) : super(key: key);

  @override
  State<VehicleCheckBox> createState() => _VehicleCheckBoxState();
}

class _VehicleCheckBoxState extends State<VehicleCheckBox> {
   bool valuefirst = false;  
  bool valuesecond = false; 

 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(22.0),
        child: Column(
          children: [
            CheckboxListTile(  
                  //secondary: const Icon(Icons.alarm),  
                  title: const Text('Ringing at 4:30 AM every day'),  
                  subtitle: Text('Ringing after 12 hours'),  
                  value: valuefirst,  
                  onChanged: (value) {
                    
                  },  
                ),  
                CheckboxListTile(  
                  controlAffinity: ListTileControlAffinity.trailing,  
                  //secondary: const Icon(Icons.alarm),  
                  title: const Text('Ringing at 5:00 AM every day'),  
                  subtitle: Text('Ringing after 12 hours'),  
                  value: valuesecond,  
                  onChanged: (value) {  
                  },  
                ),  
          ],
        ),
      ),
    );
    
  }
}