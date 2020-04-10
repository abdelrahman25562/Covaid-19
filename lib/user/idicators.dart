import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'resultpage.dart';

//=========================check-json=========================================//
class getjson extends StatelessWidget {
  // accept the langname as a parameter

  String langname;
  getjson(this.langname);
  String assettoload;

  // a function
  // sets the asset to a particular JSON file
  // and opens the JSON
  setasset() {
    assettoload = "assets/python.json";
  }

  @override
  Widget build(BuildContext context) {
    // this function is called before the build so that
    // the string assettoload is avialable to the DefaultAssetBuilder
    setasset();
    // and now we return the FutureBuilder to load and decode JSON
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: true),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
                style: TextStyle(fontFamily: 'Tajawal'),
              ),
            ),
          );
        } else {
          return quizpage(mydata: mydata);
        }
      },
    );
  }
}

//=========================================quiz-page==========================//
class quizpage extends StatefulWidget {
  var mydata;

  quizpage({Key key, @required this.mydata}) : super(key: key);
  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {
  void initState() {
    genrandomarray();
    super.initState();
  }

  var mydata;

  _quizpageState(this.mydata);

  Color colortoshow = Colors.white;
  Color right = Colors.orangeAccent;
  Color wrong = Colors.orangeAccent;
  int marks = 0;
  int i = 1;

  // extra varibale to iterate
  int j = 1;
  var random_array;

  Map<String, Color> btncolor = {
    "a": Colors.white,
    "b": Colors.white,
  };

  bool canceltimer = false;

  // code inserted for choosing questions randomly
  // to create the array elements randomly use the dart:math module
  // -----     CODE TO GENERATE ARRAY RANDOMLY

  genrandomarray() {
    var distinctIds = [];
    var rand = new Random();
    for (int i = 0;;) {
      distinctIds.add(rand.nextInt(10));
      random_array = distinctIds.toSet().toList();
      if (random_array.length < 10) {
        continue;
      } else {
        break;
      }
    }
    print(random_array);
  }

  //   var random_array;
  //   var distinctIds = [];
  //   var rand = new Random();
  //     for (int i = 0; ;) {
  //     distinctIds.add(rand.nextInt(10));
  //       random_array = distinctIds.toSet().toList();
  //       if(random_array.length < 10){
  //         continue;
  //       }else{
  //         break;
  //       }
  //     }
  //   print(random_array);

  // ----- END OF CODE
  // var random_array = [1, 6, 7, 2, 4, 10, 8, 3, 9, 5];

  // overriding the initstate function to start timer as this screen is created

  // overriding the setstate function to be called only if mounted
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void nextquestion() {
    canceltimer = false;
    setState(() {
      if (j < 10) {
        i = random_array[j];
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(marks: marks),
        ));
      }
      btncolor["a"] = Colors.white;
      btncolor["b"] = Colors.white;
    });
  }

  void checkanswer(String k) {
    // in the previous version this was
    // mydata[2]["1"] == mydata[1]["1"][k]
    // which i forgot to change
    // so nake sure that this is now corrected
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      // just a print sattement to check the correct working
      // debugPrint(mydata[2][i.toString()] + " is equal to " + mydata[1][i.toString()][k]);
      marks = marks + 5;
      // changing the color variable to be green
      colortoshow = right;
    } else {
      // just a print sattement to check the correct working
      // debugPrint(mydata[2]["1"] + " is equal to " + mydata[1]["1"][k]);
      colortoshow = wrong;
    }
    setState(() {
      // applying the changed color to the particular button that was selected
      btncolor[k] = colortoshow;
      canceltimer = true;
    });

    // changed timer duration to 1 second
    Timer(Duration(milliseconds: 500), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Tajawal',
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.white,
        highlightColor: Colors.white,
        minWidth: 200.0,
        height: 45.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.black)),
      ),
    );
  }

  final controller = PageController(initialPage: 0);
  double current = 0;
  static const k = const Duration(milliseconds: 300);
  static const g = Curves.ease;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: PageView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 80.0, bottom: 55.0, right: 30.0, left: 30.0),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
              height: MediaQuery.of(context).size.height / 2,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      'images/a.jpg',
                      height: 100.0,
                    ),
                    Column(
                      children: <Widget>[
                        //============questio-exam=============//
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 100.0),
                            alignment: Alignment.bottomLeft,
                            child: Center(
                              child: Text(
                                mydata[0][i.toString()] ?? "default",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Tajawal',
                                ),
                              ),
                            ),
                          ),
                        ),
                        //=================answer-exam========================//
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                choicebutton('a'),
                                choicebutton('b'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        controller: controller,
      ),
      bottomNavigationBar: Column(
        children: <Widget>[
          //=====================progress-bar-exam=============================//
          Padding(
            padding: const EdgeInsets.only(left: 250.0, top: 2.0, bottom: 5.0),
            child: Text(
              '${j.toInt()}/السؤال10',
              style: TextStyle(
                  fontSize: 20.0, color: Colors.white, fontFamily: 'Tajawal'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 40.0, right: 15.0, left: 15.0),
            child: Container(
              height: 55.0,
              child: Stack(
                children: <Widget>[
                  LinearProgressIndicator(
                    value: j.toInt() * 0.09,
                    backgroundColor: Colors.white70,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                  )
                ],
              ),
            ),
          )
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
