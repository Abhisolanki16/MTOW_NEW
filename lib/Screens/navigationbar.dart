import 'package:flutter/material.dart';
import 'package:login/Screens/camera_screen.dart';
import 'package:login/Screens/profile_screen.dart';
import 'package:login/Screens/scan_screen.dart';
import 'package:login/Screens/veh_records.dart';

class NavigatioBar extends StatefulWidget {
  const NavigatioBar({Key? key}) : super(key: key);

  @override
  State<NavigatioBar> createState() => _NavigatioBarState();
}

class _NavigatioBarState extends State<NavigatioBar> {
  int currentIndex = 0;
  final List<Widget> _children = [
    VehicleRecords(),
    ScanScreen(),
    ProfilePage(),
  ];

  void onTappedBar(int index)
  {
    setState(() {
      currentIndex = index;
       
    });

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(  
          appBar: AppBar(
            title: Text('M-Towing'),  
              backgroundColor: Color(0xFFFF981A),
          ),    
          body: _children[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: onTappedBar,
            fixedColor: Colors.black, 
            iconSize: 30, 
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                //icon: ImageIcon(AssetImage('assets/list1.png')),
                label: "Vehicles",
                ),
                BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt),
                label: "Camera",
                ),
                BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                )
            ],
          )  
            
           
        ),
      ),
    );  
  }
}