import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:login/Screens/profile_screen.dart';
import 'package:login/Screens/scan_screen.dart';
import 'package:login/Screens/veh_records.dart';

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
        backgroundColor: Colors.deepOrange.shade500,
        title: Text("AbhiSolanki"),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color:  Colors.deepOrange.shade500,
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
    );
  }
}


// onPressed: () {
//                   Page change using state does the same as clicking index 1 navigation button
//                   final CurvedNavigationBarState navBarState =
//                       _bottomNavigationKey.currentState;
//                   navBarState.setPage(1);
//                 },