import 'dart:io';

import 'package:flutter/material.dart';

import 'location.dart';

//================result-page========================//
class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key, @required this.marks}) : super(key: key);
  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {
  List<String> images = [
    "images/ok.jpg",
    "images/bad.png",
  ];

  String message;
  String image;

  @override
  //==========if-result-score================//
  void initState() {
    if (marks < 20) {
      image = images[0];
      message = "هناك اعراض لنزله برد\n";
    } else if (marks < 35) {
      image = images[0];
      message = "هناك اعراض لنزله برد\n";
    } else {
      image = images[1];
      message = "هناك اعراض نزله كورونا\n";
    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 150.0, right: 5.0),
              child: AlertDialog(
                title: Row(children: [
                  //=======================image-final-patient=============//
                  Image.asset(
                    image,
                    width: 200,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ]),
                //===================message-check====================//
                content: Center(
                    child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Tajawal',
                  ),
                )),
                actions: <Widget>[
                  //===========return-exam=====================//
                  Container(
                      width: MediaQuery.of(context).size.width / 3 - 15.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.deepPurple, width: 2.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      margin: EdgeInsets.only(top: 2.0),
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          color: Colors.white70,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Location()));
                          },
                          child: Text(
                            'اعاده',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.deepPurple,
                              fontFamily: 'Tajawal',
                            ),
                          ))),
                  //=================btn-exit-app=====================//
                  Container(
                      width: MediaQuery.of(context).size.width / 3 + 5,
                      height: 50.0,
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      margin: EdgeInsets.only(top: 2.0),
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          color: Colors.deepPurple,
                          onPressed: () => exit(0),
                          child: Text(
                            'انهاء',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                              fontFamily: 'Tajawal',
                            ),
                          ))),
                ],
              ),
            ),
          ],
        ));
  }
}
