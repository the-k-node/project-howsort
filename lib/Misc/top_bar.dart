import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:howsort/visualizer/constants.dart';
import 'package:howsort/visualizer/sorting_details.dart';
import 'package:howsort/sorting_thoery/tab_bar.dart';





class top_bar extends StatefulWidget {
  top_bar({Key key}) : super(key: key);
  @override
  _top_barState createState() => _top_barState();
}

class _top_barState extends State<top_bar> {


  @override
    Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Scaffold(
              appBar: AppBar(
          backgroundColor: newcolor1,
          title: Center(
child: Row(mainAxisAlignment: MainAxisAlignment.center,

children: [
 
     Image.asset("asset/ICON.png",fit: BoxFit.contain,height: 60,),
 
  
], 
),
),
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Color(0xFFD9EAF1),
                  labelColor: newcolor2,
                  unselectedLabelColor: newcolor2.withOpacity(0.6),
                  tabs: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Visualizer", textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25.0, color: newcolor2 ,fontFamily: 'Alegreya', fontWeight: FontWeight.bold)
                        
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Theory",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25.0, color: newcolor2, fontFamily: 'Alegreya', fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              body: TabBarView(
                key: UniqueKey(),
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  SortDetailsScreen(),
                  tab1_bar()
                ],
              ),
            ),
          )
    );
  }
  }