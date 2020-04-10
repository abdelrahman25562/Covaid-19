import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdmiN extends StatefulWidget {
  double lat;
  double long;
  AdmiN({this.lat, this.long});
  @override
  _AdmiNState createState() => _AdmiNState();
}

class _AdmiNState extends State<AdmiN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext ctxt, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 100,
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 35.0),
                            child: Text(
                              'احمممممممممممممممممممممممم',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10.0,
                            ),
                            child: Icon(Icons.location_on),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('المنصوره,ميت خميس'),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
