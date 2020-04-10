import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'user/indicator.dart';

void main() {
  runApp(new MaterialApp(
    title: "Corona",
    debugShowCheckedModeBanner: false,
    showSemanticsDebugger: false,
    home: new splash(),
  ));
}

//========================splash screen=====================================//
class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

//===========Timer-splash=========//
  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

//========done-splash============//
  onDoneLoading() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/splash.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}
//=======================================//
