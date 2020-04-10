import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcp4/user/location.dart';

import 'location.dart';

//================screen-before-survey==========================//
class cust extends StatefulWidget {
  //=========check-loginin===============//
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {}
  }

  @override
  _custState createState() => _custState();
}

class _custState extends State<cust> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  'images/start.jpg',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                ),
              ],
            ),
            //====================btn-start-exam==========================//
            Padding(
              padding: const EdgeInsets.all(75.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Location()));
                },
                color: Colors.deepPurpleAccent,
                child: Text(
                  'بدء الاختبار',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: 'Tajawal'),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
              ),
            )
          ],
        ),
      ],
    );
  }
}
