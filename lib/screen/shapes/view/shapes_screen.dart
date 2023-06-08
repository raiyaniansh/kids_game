import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kids_game/screen/shapes/cantroller/shapes_cantroller.dart';
import 'package:lottie/lottie.dart';

import '../../mainscreen/cantroller/main_cantroller.dart';

class ShapesScreen extends StatefulWidget {
  const ShapesScreen({Key? key}) : super(key: key);

  @override
  State<ShapesScreen> createState() => _ShapesScreenState();
}

class _ShapesScreenState extends State<ShapesScreen> {
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

  ShapesCantroller cantroller = Get.put(ShapesCantroller());
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
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset('assets/image/bg.jpg', fit: BoxFit.cover),
            ),
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 550,
                  margin: EdgeInsets.all(25),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: DragTarget(
                    onWillAccept: (data) {
                      return data==cantroller.shapelist[cantroller.i.value].img;
                    },
                    onAccept: (data) {
                        cantroller.shapelist[cantroller.i.value].isAccepted=true;
                      Timer(Duration(seconds: 2), () {
                        setState(() {
                          cantroller.changeindex();
                          if(cantroller.i.value==cantroller.shapelist.length)
                          {
                            Navigator.pushReplacementNamed(context, 'com');
                            cantroller.i--;
                          }
                        });
                      });
                    },
                    builder: (context, candidateData, rejectedData) => Obx(
                      () => Container(
                        height: 250,
                        width: 250,
                        child: (cantroller.shapelist[cantroller.i.value].isAccepted==true)?Stack(
                          children: [
                            Container(
                              height: 250,
                              width: 250,
                              alignment: Alignment.center,
                              child: Image.asset(
                                  'assets/image/${cantroller.shapelist[cantroller.i.value].img}.png',
                                ),
                            ),
                            Container(width: 250,height: 250,child: Lottie.asset('assets/lottie/celebrate.json',fit: BoxFit.cover)),
                          ],
                        ):Image.asset(
                            'assets/image/${cantroller.shapelist[cantroller.i.value].img}.png',
                            color: Colors.grey.shade100,
                          ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 35),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemCount: cantroller.shapelist.length,
                      itemBuilder: (context, index) => Draggable(
                        data: cantroller.shapelist[index].img,
                        feedback: Container(
                            height: 150,
                            width: 150,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset(
                                "assets/image/${cantroller.shapelist[index].img}.png")),
                        child: Container(
                            height: 75,
                            width: 75,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset(
                                "assets/image/${cantroller.shapelist[index].img}.png")),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                )
              ],
            ),
            Positioned(
                top: 135,
                left: 30,
                child: Container(
                    height: 205,
                    child: Lottie.asset('assets/lottie/teacher.json'))),
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
