import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kids_game/screen/mainscreen/cantroller/main_cantroller.dart';
import 'package:lottie/lottie.dart';

class ComplateScreen extends StatefulWidget {
  const ComplateScreen({Key? key}) : super(key: key);

  @override
  State<ComplateScreen> createState() => _ComplateScreenState();
}

class _ComplateScreenState extends State<ComplateScreen> {
  MainCantroller mcantroller= Get.put(MainCantroller());
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
    Timer(Duration(seconds: 8), () {
      mcantroller.balloons();
    });
    Timer(Duration(
      seconds: 10
    ), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
    return SafeArea(
      child: Scaffold(
        body: Container(width: double.infinity,height: double.infinity,child: Lottie.asset('assets/lottie/com.json',fit: BoxFit.fill),),
      ),
    );
  }
}
