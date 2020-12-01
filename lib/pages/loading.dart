import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTIme() async {
    WorldTime c1 = WorldTime(
        location: "Sri lanka", flag: "Berlin.jpg", url: "Asia/Colombo");
    await c1.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": c1.location,
      "flag": c1.flag,
      "time": c1.time,
      "isDayTime": c1.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    print("welcome");
    setUpWorldTIme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitPouringHourglass(color: Colors.white, size: 90.0),
      ),
    );
  }
}
