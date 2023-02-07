import 'package:flutter/material.dart';
import 'package:login/Screens/profile_screen.dart';
import 'package:login/Screens/staff_records.dart';
import 'package:login/veh_checkbox.dart';
import 'package:login/Screens/veh_records.dart';

class adminNavBar extends StatefulWidget {
  const adminNavBar({Key? key}) : super(key: key);

  @override
  State<adminNavBar> createState() => _adminNavBarState();
}

class _adminNavBarState extends State<adminNavBar> {
  int currentIndex = 0;
  final List<Widget> _children = [
    VehicleCheckBox(),
    staffRecords(),
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
                icon: Icon(Icons.group_sharp),
                label: "Staff",
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