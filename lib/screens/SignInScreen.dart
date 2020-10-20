import 'package:flutter/material.dart';
import './MapScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.orangeAccent[100], Colors.orangeAccent[200]],
        )),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Icon(Icons.directions_bike, size: 180),
            ),
            Text('UniCycle', style: TextStyle(fontSize: 50)),
            Text('The cool way to commute', style: TextStyle(fontSize: 30)),
            SizedBox(height: 50),
            _signInButton(context),
          ],
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
          return GoogleMapScreen();
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
                'Sign in with Google',
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
