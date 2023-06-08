import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../mainscreen/cantroller/main_cantroller.dart';

class ColorMainScreen extends StatefulWidget {
  const ColorMainScreen({Key? key}) : super(key: key);

  @override
  State<ColorMainScreen> createState() => _ColorMainScreenState();
}

class _ColorMainScreenState extends State<ColorMainScreen> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
  MainCantroller mcantroller= Get.put(MainCantroller());

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 8), () {
      mcantroller.balloons();
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
                      Timer(Duration(seconds: 1), () {
                        mcantroller.balloon.value=true;
                      });
                      Get.toNamed('duck');
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
                        Text("Duck",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  SizedBox(width: 50,),
                  InkWell(
                    onTap: () {
                      Timer(Duration(seconds: 1), () {
                        mcantroller.balloon.value=true;
                      });
                      Get.toNamed('color');
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
                              image: DecorationImage(image: AssetImage("assets/image/img7.png"),fit: BoxFit.cover)
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
                      Timer(Duration(seconds: 1), () {
                        mcantroller.balloon.value=true;
                      });
                      Get.toNamed('colorm');
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
                              image: DecorationImage(image: AssetImage("assets/image/img8.png"),fit: BoxFit.cover)
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("Colours Name",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(left: 10,bottom: 0,child: Container(height: 200,child: Lottie.asset('assets/lottie/dog.json'))),
            Positioned(
              top: 10,
              right: 25,
              child: Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    DragTarget(
                      onAccept: (data) {
                        Get.back();
                      },
                      onWillAccept: (data) {
                        return data == 'close';
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Icon(Icons.close);
                      },
                    ),
                    Expanded(child: SizedBox()),
                    Draggable(
                      data: 'close',
                      axis: Axis.horizontal,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.90),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      feedback: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.90),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      childWhenDragging: Container(),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
                  () => Container(
                child: mcantroller.balloon.value==true?Container(height: double.infinity,width: double.infinity,child: Lottie.asset('assets/lottie/balloons.json',fit: BoxFit.cover),):Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
