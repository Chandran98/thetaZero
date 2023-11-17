import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thetazero/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(color: Colors.white,
      child: Center(
          child: Image.asset(
        "assets/df.jpeg",
      )),
    ));
  }
}
