import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_game/screen/123/cantroller/123_cantroller.dart';
import 'package:kids_game/screen/mainscreen/cantroller/main_cantroller.dart';
import 'package:lottie/lottie.dart';

class AScreen extends StatefulWidget {
  const AScreen({Key? key}) : super(key: key);

  @override
  State<AScreen> createState() => _AScreenState();
}

class _AScreenState extends State<AScreen> {
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
  aCantroller cantroller = Get.put(aCantroller());
  MainCantroller mcantroller= Get.put(MainCantroller());
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 9), () {
      mcantroller.balloons();
    });
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                  'assets/image/bg.jpg',
                  fit: BoxFit.cover),
            ),
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 625,
                  margin: EdgeInsets.all(25),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 3),
                      borderRadius: BorderRadius.circular(25)),
                  child: DragTarget(
                    builder: (context, candidateData, rejectedData) {
                      return Obx(
                            () => Stack(
                              children: [
                                Center(
                                  child: Text(
                                  "${cantroller.alphabet[cantroller.i.value].number}",
                                  style: GoogleFonts.titanOne(
                                      color: (cantroller
                                          .alphabet[cantroller.i.value]
                                          .isAccept ==
                                          true)
                                          ? cantroller
                                          .alphabet[cantroller.i.value].col
                                          : Colors.white,
                                      shadows: [
                                        Shadow(color: Colors.grey, blurRadius: 2)
                                      ],
                                      fontSize: 150)),
                                ),
                        cantroller.cel.value==true?Container(margin: EdgeInsets.only(left: 185),width: 50,height: 305,child: Lottie.asset('assets/lottie/celebrate.json',fit: BoxFit.cover)):Container(),
                              ],
                            ),
                      );
                    },
                    onAccept: (data) {
                      cantroller.alphabet[cantroller.i.value].isAccept = true;
                      setState(() {
                        cantroller.cel.value=true;
                        Timer(Duration(seconds: 2),() {
                          setState(() {
                            cantroller.cel.value=false;
                            cantroller.changeIndex();
                            if(cantroller.i.value==cantroller.alphabet.length)
                            {
                              Navigator.pushReplacementNamed(context, 'com');
                              cantroller.i--;
                            }
                          });
                        },);
                      });
                    },
                    onWillAccept: (data) {
                      return data ==
                          cantroller.alphabet[cantroller.i.value].number;
                    },
                  ),
                ),
                Draggable(
                  data: cantroller.alphabet[cantroller.i.value].number,
                  child: Obx(
                        () => Text(
                        (cantroller.alphabet[cantroller.i.value].isAccept ==
                            true)
                            ? ""
                            : "${cantroller.alphabet[cantroller.i.value].number}",
                        style: GoogleFonts.titanOne(
                            color:
                            cantroller.alphabet[cantroller.i.value].col,
                            fontSize: 150)),
                  ),
                  feedback: Obx(() => Text(
                      "${cantroller.alphabet[cantroller.i.value].number}",
                      style: GoogleFonts.titanOne(
                          color:
                          cantroller.alphabet[cantroller.i.value].col,
                          fontSize: 150,
                          decoration: TextDecoration.none))),
                  childWhenDragging: Container(
                    height: 145,
                  ),
                ),
              ],
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
            Positioned(top: 48,left: 30,child: Container(height: 300,child: Lottie.asset('assets/lottie/teacher.json'))),
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
