import 'package:flutter/material.dart';
import './StartedRide.dart';

class BikeInfo extends StatefulWidget {
  @override
  _BikeInfoState createState() => _BikeInfoState();
}

class _BikeInfoState extends State<BikeInfo> {
  int _index = 0;
  List<String> reviews = [
    'Yuvraj Singh: Loved this ride! It was fun!',
    'Aishika Saha: Amazing experience!',
    'Astha Nihar: Such a low price for an amazing experience',
    'Dhruv Arora: Thank god now I can cycle to SJT'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.directions_bike, size: 180),
                  Text(
                    'Hercules Rodeo A50',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    '₹ 20/hour',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Scan QR Code',
                    style: TextStyle(fontSize: 25),
                  ),
                  Image.asset("assets/QR_Code.png", scale: 1.5),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 120,
                    child: PageView.builder(
                      itemCount: 4,
                      controller: PageController(viewportFraction: 0.7),
                      onPageChanged: (int index) =>
                          setState(() => _index = index),
                      itemBuilder: (_, i) {
                        return Transform.scale(
                          scale: i == _index ? 1 : 0.9,
                          child: Card(
                              elevation: 6,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    reviews[_index],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  _signInButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _signInButton(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0, // has the effect of softening the shadow
          spreadRadius: 1.0, // has the effect of extending the shadow
          offset: Offset(
            0, // horizontal, move right 10
            5.0, // vertical, move down 10
          ),
        ),
      ],
    ),
    child: FlatButton(
      color: Colors.deepOrange,
      splashColor: Colors.orange,
      onPressed: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return StartedRide();
        }));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Start Ride',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
