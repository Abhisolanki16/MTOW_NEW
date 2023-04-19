import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:login/Screens/profile_screen.dart';
import 'package:login/Screens/scan_screen.dart';
import 'package:login/Screens/veh_records.dart';
import 'package:login/add_user.dart';

class CurvedBar extends StatefulWidget {
  CurvedBar({
    Key? key,
  }) : super(key: key);

  @override
  _CurvedBarState createState() => _CurvedBarState();
}

class _CurvedBarState extends State<CurvedBar> {

  final List<Widget> _children = [
    VehicleRecords(),
    ScanScreen(),
    ProfilePage(),
  ];
  
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF981A),
        title: Text("M-Towing"),
        
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color:  Color(0xFFFF981A),
        backgroundColor: Colors.white,
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(Icons.list,size: 30),
          Icon(Icons.camera_alt, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _children[_page],
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader( 
              accountName: Text("Abhinav Solanki"),  
              accountEmail: Text("abhisolanki977@gmail.com"),  
              currentAccountPicture: CircleAvatar(  
                //backgroundColor: Colors.deepOrange,  
                
                child: Text(  
                  "A",  
                  style: TextStyle(fontSize: 40.0),  
                ),  
              ),  
            ),  
            ListTile(  
              leading: Icon(Icons.home), title: Text("Home"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ),  
            ListTile(  
              leading: Icon(Icons.person_add), title: Text("Add user"),  
              onTap: () {  
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddUser(),));  
              },  
            ),  
            ListTile(  
              leading: Icon(Icons.account_circle), title: Text("My profile"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ), 
             ListTile(  
              leading: Icon(Icons.settings), title: Text("Settings"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ),  
            ListTile(  
              leading: Icon(Icons.logout), title: Text("Log out"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ),  

          ],
        ),
      ),
    );
  }
}


// onPressed: () {
//                   Page change using state does the same as clicking index 1 navigation button
//                   final CurvedNavigationBarState navBarState =
//                       _bottomNavigationKey.currentState;
//                   navBarState.setPage(1);
//                 },