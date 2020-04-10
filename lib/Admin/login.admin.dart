import 'package:flutter/material.dart';
import 'package:tcp4/Admin/Admin.dart';

//================================admin-login===================================//
class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  bool _isLoading = false;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Builder(builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                new Stack(
                  children: <Widget>[
                    Image.asset(
                      'images/scretch.jpg',
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width,
                      height: 350.0,
                    ),
                    new Center(
                      child: new Container(
                        height: MediaQuery.of(context).size.height,
                        child: Container(
                          height: 200.0,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(80.0),
                                    topRight: Radius.circular(80.0))),
                            color: Colors.white,
                            elevation: 6.0,
                            margin: EdgeInsets.only(top: 275.0),
                            child: new Wrap(
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 50.0),
                                    child: Text(
                                      'مستخدم',
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          fontFamily: 'Tajawal'),
                                    ),
                                  ),
                                ),
                                new ListTile(
                                  title: Container(
                                    child: Column(
                                      children: <Widget>[
                                        //==============name-form===========//
                                        Card(
                                          child: TextFormField(
                                            textAlign: TextAlign.right,
                                            controller: emailController,
                                            cursorColor: Colors.white70,
                                            style:
                                                TextStyle(color: Colors.grey),
                                            decoration: InputDecoration(
                                              hintText: "الاسم",
                                              contentPadding:
                                                  EdgeInsets.all(15.0),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'Tajawal'),
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30.0))),
                                          elevation: 10.0,
                                        ),
                                        SizedBox(height: 10.0),
                                        //================email-form===========//
                                        Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30.0))),
                                          elevation: 10.0,
                                          child: TextFormField(
                                            textAlign: TextAlign.right,
                                            controller: passwordController,
                                            cursorColor: Colors.white70,
                                            style:
                                                TextStyle(color: Colors.grey),
                                            decoration: InputDecoration(
                                              hintText: "      الايميل    ",
                                              contentPadding:
                                                  EdgeInsets.all(15.0),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'Tajawal'),
                                            ),
                                          ),
                                        ),
                                        buttonSection()
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
          })
        ],
      ),
    );
  }

//================================btn-login-check=============================//
  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width / 3 + 20.0,
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 25.0),
      child: RaisedButton(
        onPressed: emailController.text == "" || passwordController.text == ""
            ? null
            : () {
                setState(() {
                  _isLoading = true;
                });
                signIn();
              },
        elevation: 0.0,
        color: Colors.lightBlueAccent,
        child: Text("متابعه",
            style: TextStyle(
                color: Colors.white, fontSize: 20.0, fontFamily: 'Tajawal')),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }

  signIn() async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => AdmiN()),
        (Route<dynamic> route) => false);
  }
}
