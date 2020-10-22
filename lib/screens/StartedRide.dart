import 'package:flutter/material.dart';
import 'dart:async';
import 'MapScreen.dart';

class StartedRide extends StatefulWidget {
  @override
  _StartedRideState createState() => _StartedRideState();
}

class _StartedRideState extends State<StartedRide> {
  bool flag = true;
  Stream<int> timerStream;
  StreamSubscription<int> timerSubscription;
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';

  Stream<int> stopWatchStream() {
    StreamController<int> streamController;
    Timer timer;
    Duration timerInterval = Duration(seconds: 1);
    int counter = 0;

    void stopTimer() {
      if (timer != null) {
        timer.cancel();
        timer = null;
        counter = 0;
        streamController.close();
      }
    }

    void tick(_) {
      counter++;
      streamController.add(counter);
      if (!flag) {
        stopTimer();
      }
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }

  @override
  void initState() {
    super.initState();
    timerStream = stopWatchStream();
    timerSubscription = timerStream.listen((int newTick) {
      setState(() {
        hoursStr =
            ((newTick / (60 * 60)) % 60).floor().toString().padLeft(2, '0');
        minutesStr = ((newTick / 60) % 60).floor().toString().padLeft(2, '0');
        secondsStr = (newTick % 60).floor().toString().padLeft(2, '0');
      });
    });
  }

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
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.deepOrange, spreadRadius: 3),
                        ],
                      ),
                      width: 200.0,
                      height: 200.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Timer',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "$hoursStr:$minutesStr:$secondsStr",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(color: Colors.black),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Distance Travelled',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '0 m',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  SizedBox(height: 40),
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
                'End Ride',
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
