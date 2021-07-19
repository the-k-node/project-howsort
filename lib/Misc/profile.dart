import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:howsort/Misc/login.dart';
import 'package:howsort/visualizer/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';






class profile extends StatelessWidget {
  bool isEditable  =false;
  String title = "password";
  String fname="demo",lname="demo",email="joey.food@swiggy.com";
  Color p = const Color(0xFFF46188);
  Color b = const Color(0xFF491D7F);
  CollectionReference users = FirebaseFirestore.instance.collection("users");


  Future<void> readdata() async {

   String uid = FirebaseAuth.instance.currentUser.uid.toString();

    users.doc(uid).get().then((value) => {
      fname = value.data()["fname"],
      lname = value.data()["lname"],
      email = value.data()["email"],});
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    readdata();
    return Scaffold(
              appBar: AppBar(
          backgroundColor: newcolor1,
          elevation: 0.0,
          title: Center(
child: Row(mainAxisAlignment: MainAxisAlignment.center,

children: [
 
     Image.asset("asset/ICON.png",fit: BoxFit.contain,height: 70,),
 
  
], 
),
),),



       body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("asset/profile background.png"), fit: BoxFit.fill)),
          ),
         Container(
          alignment: Alignment.center,
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
            child: new Container(
              width: double.infinity,

              child:
              Column(

                  children: [

                    new Row(

                      children: <Widget>[
                        Center(

                        child:  Column(
                           
mainAxisSize: MainAxisSize. max,
mainAxisAlignment: MainAxisAlignment. center,



                          children: [
                            Align(
                              alignment: Alignment.center,
                            
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0, left: 30.0, right: 30.0),
                              child: new Text('Hi',textScaleFactor: 1.5,textAlign: TextAlign.center ,style: TextStyle(fontFamily: 'Abril Fatface',fontSize: 15, fontWeight: FontWeight.bold, color: newcolor2), ),
                            ),),
                            Align(
                              alignment: Alignment.center,
                            child: new Text(fname,
                                textScaleFactor: 1.5,textAlign: TextAlign.center ,style: TextStyle(fontFamily: 'Abril Fatface', fontSize: 20, fontWeight: FontWeight.bold, color: newcolor2), ),
                            )
                            
                          ],
                        ),
                        )
  


                      ],
                    ),
                    new Column(

                      children:<Widget> [
                        new Container(
                          alignment : Alignment.topRight ,
                          margin: EdgeInsets.only(right: 40.0),
                          child: new Text("email"),

                        ),
                        Container(

                          padding: EdgeInsets.only(left:35.0,top:10.0,bottom:9.0,right:35.0),
                          child: new TextField(

                            readOnly: true,

                            controller: TextEditingController()..text= email,
                            decoration: InputDecoration(
                              fillColor: Colors.pink[200],
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                              ),

                            ),
                          ),
                        ),
                        new Container(
                          alignment : Alignment.bottomRight ,
                          margin: EdgeInsets.only(right: 35.0),
                          child: new Text("password"),

                        ),
                        new Container(
                          padding: EdgeInsets.only(left:35.0,top:10.0,bottom:9.0,right:35.0),
                          child:TextField(
                            readOnly: true,
                            controller: TextEditingController()..text = title,
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.pink[200],

                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                                ),
                          
                          
                                )
                            ),

                          ),
                      ],
                    ),
               /*     new Column(
                      children: [
                        new Container(
                          padding: EdgeInsets.only(top:13.0,left:20.0,bottom: 10.0),
                          alignment : Alignment.bottomLeft ,
                          child: new Text("progress.",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20 )),

                        ),

                        new Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children:<Widget> [
                            Padding(

                              padding: EdgeInsets.all(10.0),
                              child:

                              new LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width - 100,
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 15.0,
                                leading: new Text("Bubble Sort"),

                                percent: 0.4,

                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Color(0xFFF46188),
                              ),
                            ),
                            Padding(

                              padding: EdgeInsets.all(10.0),
                              child:

                              new LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width - 100,
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 15.0,
                                leading: new Text("Selection sort"),

                                percent: 0.8,

                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Color(0xFF491D7F),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                    new Row(
                        children: [
                          new Container(
                            alignment : Alignment.bottomLeft ,
                            padding: EdgeInsets.only(left:20.0,top:14.0,bottom: 7.0),
                            child: new Text("Acheivements",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20 )),

                          ),]),
                    new SizedBox(
                        height: 100,
                        child: new ListView(

                          scrollDirection: Axis.horizontal,
                          children : [
                            Container(
                              child: new Card(
                                  color: b,
                                  shape :  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)) ,

                                  child:  SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              child:  IconButton(
                                                icon: Icon(Icons.wine_bar_rounded,color: p), onPressed: () {  },
                                              ),
                                            ) ,
                                            Container(
                                                child: Text("Bubble Sort",style: TextStyle(color: Colors.white))
                                            )
                                          ],
                                        ),
                                      )
                                  )
                              ),
                            ),
                            Container(

                              child: new Card(
                                  color: b,
                                  shape :  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)) ,

                                  child:  SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              child:  IconButton(
                                                icon: Icon(Icons.wine_bar_rounded,color: p), onPressed: () {  },
                                              ),
                                            ) ,
                                            Container(
                                                child: Text("Bubble Sort",style: TextStyle(color: Colors.white))
                                            )
                                          ],
                                        ),
                                      )
                                  )
                              ),
                            ),
                            Container(
                              child: new Card(
                                  color: b,
                                  shape :  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)) ,

                                  child:  SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              child:  IconButton(
                                                icon: Icon(Icons.wine_bar_rounded,color: p,), onPressed: () {  },

                                              ),
                                            ) ,
                                            Container(
                                                child: Text("Bubble Sort",style: TextStyle(color: Colors.white),)
                                            )
                                          ],
                                        ),
                                      )
                                  )
                              ),
                            ),
                            Container(
                              child: new Card(
                                  color: b,
                                  shape :  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)) ,

                                  child:  SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              child:  IconButton(
                                                icon: Icon(Icons.wine_bar_rounded,color: p), onPressed: () {  },
                                              ),
                                            ) ,
                                            Container(
                                                child: Text("Bubble Sort",style: TextStyle(color: Colors.white))
                                            )
                                          ],
                                        ),
                                      )
                                  )
                              ),
                            ),
                          ],



                        )),

*/
                    new Row(

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      
                      children: [
                        
                        Container(
                          alignment: Alignment.bottomCenter,
                         child: Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top:40.0),
                          child: new RaisedButton(
                               shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                          color: newcolor2,
                          textColor: Colors.white,
                          elevation: 10,
                              child: Text("Logout",textScaleFactor: 1.5,textAlign: TextAlign.center ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, ), ),
                             
                              onPressed: () async{
                                await FirebaseAuth.instance.signOut();
                                Navigator.of(context).pushNamedAndRemoveUntil("/login",(Route<dynamic> route)=> false);
                              },
                            ),
                        ),
                     ),
                   ),
                      ],
                    )

                  ]

              ),

            ), ),
         ),
        ],

    ),);



  }
}

