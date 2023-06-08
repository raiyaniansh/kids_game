import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, 'mainhome');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(margin: EdgeInsets.only(left: 325,top: 30),height: 175,child: Lottie.asset('assets/lottie/puzzle.json')),
            Container(margin: EdgeInsets.only(left: 285,top: 255),width: 175,child: Image.asset('assets/image/logopng.png',color: Colors.black,fit: BoxFit.cover,)),
            Container(margin: EdgeInsets.only(left: 240,top: 200),width: 270,child: Lottie.asset('assets/lottie/loader.json',fit: BoxFit.cover)),
          ],
        ),
      ),
    );
  }
}
