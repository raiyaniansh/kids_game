import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kids_game/screen/mainscreen/cantroller/main_cantroller.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainCantroller cantroller= Get.put(MainCantroller());
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
      cantroller.balloons();
    });
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(height: double.infinity,width: double.infinity,child: Image.asset('assets/image/mbg.png',fit: BoxFit.cover,)),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Timer(Duration(seconds: 1),() {
                        cantroller.balloon.value=true;
                      },);
                      Get.toNamed('text');
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 300,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(color: Colors.white,width: 3),
                              image: DecorationImage(image: AssetImage("assets/image/img.png"),fit: BoxFit.cover)
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("Letters",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  SizedBox(width: 50,),
                  InkWell(
                    onTap: () {
                      Timer(Duration(seconds: 1),() {
                        cantroller.balloon.value=true;
                      },);
                      Get.toNamed('shapeMain');
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 300,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(color: Colors.white,width: 3),
                              image: DecorationImage(image: AssetImage("assets/image/img3.jpg"),fit: BoxFit.cover)
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("Shapes",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  SizedBox(width: 50,),
                  InkWell(
                    onTap: () {
                      Timer(Duration(seconds: 1),() {
                        cantroller.balloon.value=true;
                      },);
                      Get.toNamed('colormain');
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 300,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(color: Colors.white,width: 3),
                              image: DecorationImage(image: AssetImage("assets/image/img6.png"),fit: BoxFit.cover)
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("Colours",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  SizedBox(width: 50,),
                  InkWell(
                    onTap: () {
                      Timer(Duration(seconds: 1),() {
                        cantroller.balloon.value=true;
                      },);
                      Get.toNamed('math');
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 300,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(color: Colors.white,width: 3),
                              image: DecorationImage(image: AssetImage("assets/image/img9.png"),fit: BoxFit.cover)
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("Maths",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => Container(
                child: cantroller.balloon.value==true?Container(height: double.infinity,width: double.infinity,child: Lottie.asset('assets/lottie/balloons.json',fit: BoxFit.cover),):Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
