import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:howsort/Misc/login.dart';
import 'package:howsort/Misc/profile.dart';
import 'package:howsort/quiz/quizmain.dart';
import'package:howsort/Misc/top_bar.dart';
import 'package:howsort/Misc/authcheck.dart';
import 'package:howsort/visualizer/constants.dart';




class Bottom_Navigator extends StatefulWidget {
  Bottom_Navigator({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _Bottom_NavigatorState createState() => _Bottom_NavigatorState();
}

class _Bottom_NavigatorState extends State<Bottom_Navigator> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
   top_bar(),
    MyAppQuiz(),
    profile()
  ];
  static  List<Widget> _widgetOptionsAuth = <Widget>[
    top_bar(),
    authcheck(),
    authcheck()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

       body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: FirebaseAuth.instance.currentUser == null?_widgetOptionsAuth.elementAt(_selectedIndex): _widgetOptions.elementAt(_selectedIndex),
      ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp),
              label: 'User Profile',
            ),
          ],
          currentIndex: _selectedIndex,
            unselectedItemColor: Colors.white,
          selectedItemColor: Color(0xFFF46188),
          backgroundColor: newcolor2,
          onTap:  _onItemTapped,
        ),


    );
  }
}
