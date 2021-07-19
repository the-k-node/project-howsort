import 'package:howsort/Misc/bottom_navigator.dart';
import 'package:howsort/Misc/top_bar.dart';
import 'package:howsort/Misc/profile.dart';
import 'package:howsort/Misc/login.dart';
import 'package:howsort/Misc/register.dart';
import 'package:howsort/Misc/spash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp defaultApp = await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithms',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         ),
        home:  FirebaseAuth.instance.currentUser == null ? LoginPage()  :Bottom_Navigator(),
        routes: <String, WidgetBuilder>{
          '/bottomnav' : (BuildContext context) => Bottom_Navigator(),
          '/topbar': (BuildContext context) => top_bar(),
          '/profile': (BuildContext context) => profile(),
          '/login': (BuildContext context) => new  LoginPage(),
          '/register': (BuildContext context) => RegisterPage(),
          '/splash' : (BuildContext context) => SplashPage(),
        }

    );
  }
}
