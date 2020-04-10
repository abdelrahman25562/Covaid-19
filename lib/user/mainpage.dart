import 'package:flutter/material.dart';
import 'package:tcp4/Admin/login.admin.dart';

import 'USER.dart';

//=================================Sign-in=====================================//
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0)),
            child: Image.asset(
              'images/scretch.jpg',
              fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).size.height / 2 + 10,
            ),
          ),
          SizedBox(
            height: 0.0,
          ),
          Image.asset(
            'images/corona.jpg',
            height: MediaQuery.of(context).size.height / 11,
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text(
              'تسجيل الدخول',
              style: TextStyle(fontSize: 25.0, fontFamily: 'Tajawal'),
            ),
          ),
          buttonSection(),
          buttonSection2()
        ],
      ),
    );
  }

//===================================user-btn=================================//
  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width / 10,
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      margin: EdgeInsets.only(top: 25.0),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));
        },
        elevation: 0.0,
        color: Colors.lightBlueAccent,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
            child: Text('مستخدم',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontFamily: 'Tajawal'))),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }

//======================================admin-btn=============================//
  Container buttonSection2() {
    return Container(
      width: MediaQuery.of(context).size.width / 10,
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      margin: EdgeInsets.only(top: 25.0),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Admin()));
        },
        elevation: 0.0,
        color: Colors.lightBlueAccent,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Admin()));
            },
            child: Text('مشرف',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontFamily: 'Tajawal'))),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}
