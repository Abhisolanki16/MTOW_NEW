import 'package:flutter/material.dart';  
  
  
class MyNavigationBar extends StatefulWidget {   
  
  @override  
  _MyNavigationBarState createState() => _MyNavigationBarState();  
}  
  
class _MyNavigationBarState extends State<MyNavigationBar > {  
  int _selectedIndex = 0;  
  static const List<Widget> _widgetOptions = <Widget>[  
    Text('Vehicle Records', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
    Text('Camera', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
  ];  
  
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('M-Towing'),   
      ),  
      body: Center(  
        child: _widgetOptions.elementAt(_selectedIndex),  
      ),  
      bottomNavigationBar: BottomNavigationBar(  
        items: const <BottomNavigationBarItem>[  
          BottomNavigationBarItem(  
            icon: Icon(Icons.list),  
            label: 'Home',  
            backgroundColor: Colors.green  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.search),  
            label:'Search',  
            backgroundColor: Colors.yellow  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.person),  
            label: 'Profile',  
            backgroundColor: Colors.blue,  
          ),  
        ],  
        type: BottomNavigationBarType.shifting,  
        currentIndex: _selectedIndex,  
        selectedItemColor: Colors.black,  
        iconSize: 40,  
        onTap: _onItemTapped,  
        elevation: 5  
      ),  
    );  
  }  
}  