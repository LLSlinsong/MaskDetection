//import 'dart:io';

import 'package:ai.queryai.flutter_app/pages/WorkFlows.dart';
import 'package:ai.queryai.flutter_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'Home_page.dart';
import 'package:ai.queryai.flutter_app/model/Data_LoginToWorkFlow.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState()=>new _SplashScreenState();
}class _SplashScreenState extends State<SplashScreen>{
  @override
  
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),()=>Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    ),);

  }
  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blueAccent)
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 100.0,
                        child:
                          Image.asset('assets/images/Query.AI.png'),
                        )

                    ]
                  )
                )
              ),
              Expanded(
                flex:1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top:20.0),
                    ),
                    
                  ]
                )
              )
            ]
          )
        ],
      )
    );
  }
}