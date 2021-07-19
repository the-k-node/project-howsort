

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:howsort/visualizer/constants.dart';



class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;


  @override
  initState() {

    firstNameInputController = new TextEditingController();
    lastNameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    super.initState();
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

  Future<void> usersetup(String fname, String lname,String email) async {
    String uid = FirebaseAuth.instance.currentUser.uid.toString();
    users.doc(uid).set(
        {
          'fname': fname,
          'lname': lname,
          'email': email,
          'uid': uid}
    )
    .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    return;
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
        body:Stack(
        children: <Widget>[
        new Container(
            decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("asset/registerwall.png"), fit: BoxFit.fill)),
          ),
        Container(
            padding: const EdgeInsets.all(20.0),

            child: SingleChildScrollView(
                child: Form(
                  key: _registerFormKey,
                  child: Column(
                    children: <Widget>[
                      Align(
          alignment: Alignment.topCenter,
            
            child: Padding(
              padding: const EdgeInsets.only(top:3.0),
              child: Text(' Register ',textAlign: TextAlign.center ,style: TextStyle(fontFamily: 'Abril Fatface',fontSize: 40, fontWeight: FontWeight.bold, color: newcolor2), ),
            ),
          ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top:60.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.pink[100],
                              filled: true,
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)) ),
                                labelText: 'First Name*', hintText: "John"),
                            controller: firstNameInputController,
                            validator: (value) {
                              if (value.length < 3) {
                                return "Please enter a valid first name.";
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.pink[100],
                            filled: true,
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)) ),
                                labelText: 'Last Name*', hintText: "Doe"),
                            controller: lastNameInputController,
                            validator: (value) {
                              if (value.length < 3) {
                                return "Please enter a valid last name.";
                              }
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                        padding: const EdgeInsets.all(8.0),
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
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.pink[100],
                            filled: true,
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)) ),
                              labelText: 'Confirm Password*', hintText: "********"),
                          controller: confirmPwdInputController,
                          obscureText: true,
                          validator: pwdValidator,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                          elevation: 30,
                          child: Text("Register"),
                          color: newcolor2,
                          textColor: Colors.white,
                          onPressed: () async {
                            if (_registerFormKey.currentState.validate()) {
                              if (pwdInputController.text ==
                                  confirmPwdInputController.text) {
                                try {
                                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                      email: emailInputController.text,
                                      password: pwdInputController.text
                                  );
                                  if(userCredential.user != null)
                                    {
                                      usersetup(firstNameInputController.text, lastNameInputController.text,emailInputController.text);
                                    }

                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    print('The password provided is too weak.');
                                    pwdInputController.clear();
                                    confirmPwdInputController.clear();
                                  } else if (e.code == 'email-already-in-use') {
                                    print('The account already exists for that email.');
                                    emailInputController.clear();
                                    pwdInputController.clear();
                                    confirmPwdInputController.clear();
                                  }
                                } catch (e) {
                                  print(e);
                                }



                                  Navigator.of(context).pushNamedAndRemoveUntil( "/login",(Route<dynamic> route) => false);
                                 firstNameInputController.clear();
                                  lastNameInputController.clear();
                                  emailInputController.clear();
                                  pwdInputController.clear();
                                  confirmPwdInputController.clear();


                            } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Error"),
                                        content: Text("The passwords do not match"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("Close"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                              }
                            }
                          },
                        ),
                      ),
                       Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[
      //your elements here
 
                      Text("Already have an account?"),
                      RaisedButton(
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                            child: Text("Login Here!"),
                          color: Colors.white,
                          textColor: newcolor1,
                          elevation: 30,
                        
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                       ],
),
                    ],
                  ),
                )
                )
                ),
        ],
    )
                );

  }
}