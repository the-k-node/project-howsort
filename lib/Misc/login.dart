import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:howsort/visualizer/constants.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
 

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  /*  if(FirebaseAuth.instance.currentUser != null){

      Navigator.of(context).pushNamedAndRemoveUntil("/bottomnav",(Route<dynamic> route)=> false);
    }*/
  /*  FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      if (user.uid == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        Navigator.of(context).pushNamedAndRemoveUntil("/bottomnav",(Route<dynamic> route)=> false);
      }
    });*/
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }
Future<void> _emailDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Login Error'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This email is not registered'),
              Text('Please try with another email ID'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _pwdDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Login Error'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is password is incorrect'),
              Text('Please enter correct password')
              
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          elevation: 0.0,
          backgroundColor: newcolor1,
          title: Center(
child: Row(mainAxisAlignment: MainAxisAlignment.center,

children: [
 
     Image.asset("asset/ICON.png",fit: BoxFit.contain,height: 50,),
  Container(child: Text("owSort",textAlign: TextAlign.center, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color:Colors.white, fontFamily: 'Yatra_One' )), ),
  
], 
),
),
shadowColor: Colors.pinkAccent,
brightness: Brightness.dark,
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.0), bottomRight: Radius.circular(0.0),),
 
),
),
        body: Stack(
        children: <Widget>[
        new Container(
            decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("asset/loginwall.png"), fit: BoxFit.fill)),
          ),
         Container(
          alignment: Alignment.center,
            padding: const EdgeInsets.all(20.0),
        child: Container(
          alignment: Alignment.center,
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: <Widget> [
                      Align(
          alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom:50.0),
              child: Text(' Sign In  ',textAlign: TextAlign.center ,style: TextStyle(fontFamily: 'Abril Fatface',fontSize: 40, fontWeight: FontWeight.bold, color: newcolor2), ),
            ),
          ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.pink[100],
                              filled: true,
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)) ),
                            
                              labelText: 'Email*', hintText: "john.doe@gmail.com"),
                          controller: emailInputController,
                          keyboardType: TextInputType.emailAddress,
                          validator: emailValidator,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: TextFormField(
                          
                          decoration: InputDecoration(
                            fillColor: Colors.pink[100],
                            filled: true,
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)) ),
          
                              labelText: 'Password*', hintText: "********"),
                          controller: pwdInputController,
                          
                          obscureText: true,
                          validator: pwdValidator,
                          
                        ),
                        ),
 
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                          child: Text("Login"),
                          color: newcolor2,
                          textColor: Colors.white,
                          elevation: 10,
                          onPressed: () async {
                            if (_loginFormKey.currentState.validate()) {
                              try {
                                UserCredential usercredential = await FirebaseAuth
                                    .instance
                                    .signInWithEmailAndPassword(
                                    email: emailInputController.text,
                                    password: pwdInputController.text);
                                if(usercredential.user != null)
                                {
                                  Navigator.of(context).pushNamedAndRemoveUntil("/bottomnav",(Route<dynamic> route)=> false);
                                 
                                }
                              }
                              on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                            _emailDialog();
                            emailInputController.clear();
                            pwdInputController.clear();
                            } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                            _pwdDialog();
                            pwdInputController.clear();
                            }
                            }


                            }

                          },
                        ),
                      ),
                     Container(
                          child:
                        Padding(
                          padding: const EdgeInsets.only(top:17.0),
                          child: Text("Don't have an account yet?"),
                        ),
                        ),
                      
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: new RaisedButton(
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                          child: Text("Register here!"),
                          color: newcolor2,
                          textColor: Colors.white,
                          elevation: 10,
                            
                            onPressed: () {
                              Navigator.of(context).pushNamed("/register");
                            },
                          ),
                      ),
                    ),
                  Container(
                    alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:5.0),
                        child: 
                     new RaisedButton(
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                            child: Text("Skip Login"),
                          color: Colors.white,
                          textColor: newcolor1,
                          elevation: 10,
                            onPressed: () {
                              Navigator.of(context).pushNamed("/bottomnav");
                            },
                          ),
                      ),
                    ),
                    ],
                  ),
                )
                )
                )
                )
        ],
        ),
    );
      
  }
}

