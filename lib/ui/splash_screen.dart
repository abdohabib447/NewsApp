import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/ui/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'splash screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    Timer(Duration(seconds: 7),() {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset('assets/images/splash.png',
        height: double.infinity ,
            width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
