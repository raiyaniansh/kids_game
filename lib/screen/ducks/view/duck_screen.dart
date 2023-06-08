import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kids_game/screen/ducks/cantroller/duck_cantroller.dart';
import 'package:kids_game/screen/mainscreen/cantroller/main_cantroller.dart';
import 'package:lottie/lottie.dart';

class DuckScreen extends StatefulWidget {
  const DuckScreen({Key? key}) : super(key: key);

  @override
  State<DuckScreen> createState() => _DuckScreenState();
}

class _DuckScreenState extends State<DuckScreen> {
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

  DuckCantoller cantoller = Get.put(DuckCantoller());
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
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "assets/image/fbg1.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 40,
              child: Container(
                height: 60,
                width: 780,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    color: Colors.blue.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Draggable(
                    data: cantoller.ducklist[index].img,
                    feedback: Image.asset(
                      'assets/image/${cantoller.ducklist[index].img}.png',
                      height: 100,
                    ),
                    child: Image.asset(
                      'assets/image/${cantoller.ducklist[index].img}.png',
                    ),
                  ),
                  itemCount: cantoller.ducklist.length,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DragTarget(
                    onWillAccept: (data) {
                      return data == 'yellowduck';
                    },
                    onAccept: (data) {
                      cantoller.ducklist[0].isAccpted = true;
                      cantoller.ducklist[0].cel = true;
                      Timer(Duration(seconds: 2), () {
                        setState(() {
                          cantoller.ducklist[0].cel = false;
                        });
                      });
                    },
                    builder: (context, candidateData, rejectedData) =>
                        Container(
                      height: 115,
                      child: cantoller.ducklist[0].isAccpted == true
                          ? Obx(
                              () => Stack(
                                children: [
                                  Container(
                                      height: 115,
                                      child: Image.asset(
                                          'assets/image/yellowtubes.png')),
                                  Positioned(
                                      left: 45,
                                      top: 0,
                                      child: Container(
                                          height: 50,
                                          child: Image.asset(
                                            'assets/image/yellowduck.png',
                                          ))),
                                  cantoller.ducklist[0].cel == true
                                      ? Container(
                                          height: 115,
                                          width: 168,
                                          child: Lottie.asset(
                                              'assets/lottie/celebrate.json',
                                              fit: BoxFit.cover),
                                        )
                                      : Container(),
                                ],
                              ),
                            )
                          : Image.asset('assets/image/yellowtubes.png'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DragTarget(
                    onWillAccept: (data) {
                      return data == 'blueduck';
                    },
                    onAccept: (data) {
                      cantoller.ducklist[1].isAccpted = true;
                      cantoller.ducklist[1].cel = true;
                      Timer(Duration(seconds: 2), () {
                        setState(() {
                          cantoller.ducklist[1].cel = false;
                        });
                      });
                    },
                    builder: (context, candidateData, rejectedData) =>
                        Container(
                      height: 95,
                      child: Container(
                        height: 115,
                        child: cantoller.ducklist[1].isAccpted == true
                            ? Stack(
                                children: [
                                  Container(
                                      height: 115,
                                      child: Image.asset(
                                          'assets/image/bluetubs.png')),
                                  Positioned(
                                      left: 40,
                                      top: 0,
                                      child: Container(
                                          height: 40,
                                          child: Image.asset(
                                            'assets/image/blueduck.png',
                                          ))),
                                  cantoller.ducklist[1].cel == true
                                      ? Container(
                                          height: 115,
                                          width: 138,
                                          child: Lottie.asset(
                                              'assets/lottie/celebrate.json',
                                              fit: BoxFit.cover),
                                        )
                                      : Container(),
                                ],
                              )
                            : Image.asset('assets/image/bluetubs.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DragTarget(
                    onWillAccept: (data) {
                      return data == 'pinkduck';
                    },
                    onAccept: (data) {
                      cantoller.ducklist[4].isAccpted = true;
                      cantoller.ducklist[4].cel = true;
                      Timer(Duration(seconds: 2), () {
                        setState(() {
                          cantoller.ducklist[4].cel = false;
                        });
                      });
                    },
                    builder: (context, candidateData, rejectedData) =>
                        Container(
                      height: 75,
                      child: Container(
                        height: 115,
                        child: cantoller.ducklist[4].isAccpted == true
                            ? Stack(
                                children: [
                                  Container(
                                      height: 115,
                                      child: Image.asset(
                                          'assets/image/pinktubes.png')),
                                  Positioned(
                                      left: 30,
                                      top: 0,
                                      child: Container(
                                          height: 33,
                                          child: Image.asset(
                                            'assets/image/pinkduck.png',
                                          ))),
                                  cantoller.ducklist[4].cel == true
                                      ? Container(
                                          height: 115,
                                          width: 108,
                                          child: Lottie.asset(
                                              'assets/lottie/celebrate.json',
                                              fit: BoxFit.cover),
                                        )
                                      : Container(),
                                ],
                              )
                            : Image.asset('assets/image/pinktubes.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DragTarget(
                    onWillAccept: (data) {
                      return data == 'lightblueduck';
                    },
                    onAccept: (data) {
                      cantoller.ducklist[3].isAccpted = true;
                      cantoller.ducklist[3].cel = true;
                      Timer(Duration(seconds: 2), () {
                        setState(() {
                          cantoller.ducklist[3].cel = false;
                        });
                      });
                    },
                    builder: (context, candidateData, rejectedData) =>
                        Container(
                      height: 95,
                      child: Container(
                        height: 115,
                        child: cantoller.ducklist[3].isAccpted == true
                            ? Stack(
                                children: [
                                  Container(
                                      height: 115,
                                      child: Image.asset(
                                          'assets/image/lightbluetubs.png')),
                                  Positioned(
                                      left: 40,
                                      top: 0,
                                      child: Container(
                                          height: 40,
                                          child: Image.asset(
                                            'assets/image/lightblueduck.png',
                                          ))),
                                  cantoller.ducklist[3].cel == true
                                      ? Container(
                                          height: 115,
                                          width: 138,
                                          child: Lottie.asset(
                                              'assets/lottie/celebrate.json',
                                              fit: BoxFit.cover),
                                        )
                                      : Container(),
                                ],
                              )
                            : Image.asset('assets/image/lightbluetubs.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DragTarget(
                    onWillAccept: (data) {
                      return data == 'greenduck';
                    },
                    onAccept: (data) {
                      cantoller.ducklist[2].isAccpted = true;
                      cantoller.ducklist[2].cel = true;
                      Timer(Duration(seconds: 2), () {
                        setState(() {
                          cantoller.ducklist[2].cel = false;
                        });
                      });
                    },
                    builder: (context, candidateData, rejectedData) =>
                        Container(
                      height: 115,
                      child: Container(
                        height: 115,
                        child: cantoller.ducklist[2].isAccpted == true
                            ? Stack(
                                children: [
                                  Container(
                                      height: 115,
                                      child: Image.asset(
                                          'assets/image/greentubes.png')),
                                  Positioned(
                                      left: 40,
                                      top: 0,
                                      child: Container(
                                          height: 50,
                                          child: Image.asset(
                                            'assets/image/greenduck.png',
                                          ))),
                                  cantoller.ducklist[2].cel == true
                                      ? Container(
                                          height: 115,
                                          width: 168,
                                          child: Lottie.asset(
                                              'assets/lottie/celebrate.json',
                                              fit: BoxFit.cover),
                                        )
                                      : Container(),
                                ],
                              )
                            : Image.asset('assets/image/greentubes.png'),
                      ),
                    ),
                  ),
                ],
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
