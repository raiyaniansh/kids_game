import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kids_game/screen/mainscreen/cantroller/main_cantroller.dart';
import 'package:kids_game/screen/shape/cantroller/shape_cantroller.dart';
import 'package:lottie/lottie.dart';

class ShapeScreen extends StatefulWidget {
  const ShapeScreen({Key? key}) : super(key: key);

  @override
  State<ShapeScreen> createState() => _ShapeScreenState();
}

class _ShapeScreenState extends State<ShapeScreen> {
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

  MainCantroller mcantroller= Get.put(MainCantroller());
  ShapeCantroller cantroller = Get.put(ShapeCantroller());
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
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  "assets/image/fbg1.jpg",
                  fit: BoxFit.cover,
                )),
            Positioned(
              bottom: 10,
              left: 180,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 175,
                    child: Stack(
                      children: [
                        DragTarget(
                        builder: (context, candidateData, rejectedData) => Image.asset('assets/image/redbin.png'),
                          onAccept: (data) {
                            cantroller.shapelist.removeAt(cantroller.i.value);
                          },
                          onWillAccept: (data) {
                            return data=='circle';
                          },
                        ),
                        Positioned(
                            left: 25,
                            bottom: 45,
                            child: Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Image.asset('assets/image/circle.png',
                                  color: Colors.red),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 135,
                    child: Stack(
                      children: [
                        DragTarget(
                          builder: (context, candidateData, rejectedData) => Image.asset('assets/image/greenbin.png'),
                          onAccept: (data) {
                            cantroller.shapelist.removeAt(cantroller.i.value);
                          },
                          onWillAccept: (data) {
                            return data=='star';
                          },
                        ),
                        Positioned(
                            left: 18,
                            bottom: 35,
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Image.asset('assets/image/star.png',
                                  color: Colors.green.shade400),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 135,
                        child: DragTarget(
                          builder: (context, candidateData, rejectedData) =>
                              Image.asset('assets/image/yellowbin.png'),
                          onAccept: (data) {
                            cantroller.shapelist.removeAt(cantroller.i.value);
                          },
                          onWillAccept: (data) {
                            return data == 'rhombus';
                          },
                        ),
                      ),
                      Positioned(
                          left: 18,
                          bottom: 35,
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Image.asset('assets/image/rhombus.png',
                                color: Colors.yellow),
                          ),)
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 175,
                        child: DragTarget(
                          builder: (context, candidateData, rejectedData) =>
                              Image.asset('assets/image/bluebin.png'),
                          onAccept: (data) {
                            cantroller.shapelist.removeAt(cantroller.i.value);
                          },
                          onWillAccept: (data) {
                            return data == 'heart';
                          },
                        ),
                      ),
                      Positioned(
                          left: 25,
                          bottom: 45,
                          child: Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Image.asset('assets/image/heart.png',
                                color: Colors.blue),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50,left: 10,right: 10),
              width: double.infinity,
              height: 65,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)),
              child: Expanded(
                child: Obx(
                  () =>  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cantroller.shapelist.length,
                    itemBuilder: (context, index) => Draggable(
                      onDragStarted: () {
                        cantroller.i.value=index;
                      },
                      data: cantroller.shapelist[index].key,
                      childWhenDragging: Container(),
                        feedback: Container(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                              '${cantroller.shapelist[index].shape}',
                              color: Colors.black),
                        ),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Image.asset('${cantroller.shapelist[index].shape}',
                              color: Colors.black),
                        )),
                  ),
                ),
              ),
            ),
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
