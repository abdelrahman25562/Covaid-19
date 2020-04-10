import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'idicators.dart';

//=========================get-location-user==================================//
class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;
  bool btn_enable = true;

  @override
  Widget build(BuildContext context) {
    String langname;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'حدد موقعك   ',
              style: TextStyle(fontSize: 35.0, fontFamily: 'Tajawal'),
            ),
            //============btn-location============//
            FlatButton(
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Card(
                  margin: EdgeInsets.all(9.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      'images/location.jpg',
                      height: 100.0,
                      width: 150.0,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                _getCurrentLocation();
                setState(() => btn_enable = !btn_enable);
              },
            ),
            SizedBox(
              height: 12.0,
            ),
            if (_currentPosition != null)
              Text(
                _currentAddress ?? "",
                style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
              ),
            SizedBox(
              height: 150.0,
            ),
            //===========start-exam==================//
            Card(
                color: Colors.deepPurple,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    onPressed: btn_enable
                        ? () {}
                        : () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => getjson(langname)));
                          },
                    child: Text(
                      btn_enable ? 'تحديد موقعك أولا' : 'بدأ',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontFamily: 'Tajawal'),
                    ))),
          ],
        ),
      ),
    );
  }

//=======================================current-location======================//
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

//==================================get-address-user==========================//
  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality},${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}
