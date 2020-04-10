import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'mainpage.dart';

//====================scroll-image=========================================//
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _page = PageController();
  double current = 0;
  void initState() {
    _page.addListener(() {
      setState(() {
        current = _page.page;
      });
    });
    super.initState();
  }

  final controller = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          //==============first-scroll-screen====================//
          SizedBox(
            height: MediaQuery.of(context).size.height - 90,
            width: MediaQuery.of(context).size.width,
            child: PageView(
              controller: _page,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'images/girl.jpg',
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'اختبار شامل',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Tajawal',
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        '            سنوجه اليك بعض الاسئله \nالتى سوف تساعدك على الاطمئنان بصحتك',
                        style: TextStyle(fontSize: 15.0, fontFamily: 'Tajawal'),
                      ),
                      //=================containe===============//
                      Container(
                        width: MediaQuery.of(context).size.width / 3 + 20.0,
                        height: 50.0,
                        margin: EdgeInsets.only(top: 25.0),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()));
                          },
                          elevation: 0.0,
                          color: Colors.deepPurple,
                          child: Text("متابعه",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontFamily: 'Tajawal')),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                //===========ssecond-scroll-splash===========//
                SizedBox(
                  height: MediaQuery.of(context).size.height - 90,
                  width: MediaQuery.of(context).size.width,
                  child: PageView(
                    pageSnapping: true,
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'images/boy.jpg',
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '   نتائج فوريه',
                              style: TextStyle(
                                  fontSize: 25.0, fontFamily: 'Tajawal'),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              '            بعد الاجابه على كل الاسئله \nسوف نعرض لك ما هى حالتك الصحيه فورا',
                              style: TextStyle(
                                  fontSize: 15.0, fontFamily: 'Tajawal'),
                            ),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 3 + 20.0,
                              height: 50.0,
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              margin: EdgeInsets.only(top: 25.0),
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage()));
                                },
                                elevation: 0.0,
                                color: Colors.deepPurple,
                                child: Text("متابعه",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontFamily: 'Tajawal')),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 45),
          SmoothPageIndicator(
            controller: _page,
            count: 2,
            effect: JumpingDotEffect(),
          ),
        ],
      ),
    );
  }
}
