import 'package:flutter/material.dart';

class BikeInfo extends StatefulWidget {
  @override
  _BikeInfoState createState() => _BikeInfoState();
}

class _BikeInfoState extends State<BikeInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text('hello!'),
        ),
      ),
    );
  }
}
