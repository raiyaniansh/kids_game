import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_game/screen/abc/cantroller/abc_cantroller.dart';
import 'package:lottie/lottie.dart';

import '../../mainscreen/cantroller/main_cantroller.dart';

class AbcScreen extends StatefulWidget {
  const AbcScreen({Key? key}) : super(key: key);

  @override
  State<AbcScreen> createState() => _AbcScreenState();
}

class _AbcScreenState extends State<AbcScreen> {
  AbcCantroller cantroller = Get.put(AbcCantroller());
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
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 8), () {
      mcantroller.balloons();
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DragTarget(
                        builder: (context, candidateData, rejectedData) {
                          return Obx(
                            () => Stack(
                              children: [
                                cantroller.cel.value==true?Container(width: 50,height: 305,child: Lottie.asset('assets/lottie/celebrate.json',fit: BoxFit.cover)):Container(),
                                Center(
                                  child: Text(
                                      "${cantroller.alphabet[cantroller.i.value].alphabets}",
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
                              ],
                            ),
                          );
                        },
                        onAccept: (data) {
                          setState(() {
                            cantroller.alphabet[cantroller.i.value].isAccept = true;
                            cantroller.cel.value=true;
                            Timer(Duration(seconds: 2),() {
                              setState(() {
                                cantroller.cel.value=false;
                              });
                            },);
                            if(cantroller.alphabet[cantroller.i.value].isAccept==true&&cantroller.smallalphabet[cantroller.i.value].isAccept==true)
                            {
                              Timer(Duration(seconds: 2),() {
                                setState(() {
                                  cantroller.changeIndex();
                                  if(cantroller.i.value==cantroller.smallalphabet.length)
                                  {
                                    Navigator.pushReplacementNamed(context, 'com');
                                    cantroller.i.value=0;
                                  }
                                });
                              },);
                            }
                          });
                        },
                        onWillAccept: (data) {
                          return data == cantroller.alphabet[cantroller.i.value].alphabets;
                        },
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      DragTarget(
                        builder: (context, candidateData, rejectedData) {
                          return Obx(
                                () => Text(
                                "${cantroller.smallalphabet[cantroller.i.value].small}",
                                style: GoogleFonts.titanOne(
                                    color: (cantroller
                                        .smallalphabet[cantroller.i.value]
                                        .isAccept ==
                                        true)
                                        ? cantroller
                                        .smallalphabet[cantroller.i.value].col
                                        : Colors.white,
                                    shadows: [
                                      Shadow(color: Colors.grey, blurRadius: 2)
                                    ],
                                    fontSize: 150)),
                          );
                        },
                        onAccept: (data) {
                          cantroller.smallalphabet[cantroller.i.value].isAccept = true;
                          cantroller.cel.value=true;
                          Timer(Duration(seconds: 2),() {
                            setState(() {
                              cantroller.cel.value=false;
                            });
                          },);
                          setState(() {
                            if(cantroller.alphabet[cantroller.i.value].isAccept==true&&cantroller.smallalphabet[cantroller.i.value].isAccept==true)
                              {
                                Timer(Duration(seconds: 2),() {
                                  setState(() {
                                    cantroller.changeIndex();
                                    if(cantroller.i.value==cantroller.smallalphabet.length)
                                    {
                                      Navigator.pushReplacementNamed(context, 'com');
                                      cantroller.i.value=0;
                                    }
                                  });
                                },);
                              }
                          });
                        },
                        onWillAccept: (data) {
                          return data ==
                              cantroller.smallalphabet[cantroller.i.value].small;
                        },
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Draggable(
                      data: cantroller.alphabet[cantroller.i.value].alphabets,
                      child: Obx(
                        () => Text(
                            (cantroller.alphabet[cantroller.i.value].isAccept ==
                                    true)
                                ? ""
                                : "${cantroller.alphabet[cantroller.i.value].alphabets}",
                            style: GoogleFonts.titanOne(
                                color:
                                    cantroller.alphabet[cantroller.i.value].col,
                                fontSize: 150)),
                      ),
                      feedback: Obx(() => Text(
                          "${cantroller.alphabet[cantroller.i.value].alphabets}",
                          style: GoogleFonts.titanOne(
                              color: cantroller.alphabet[cantroller.i.value].col,
                              fontSize: 150,
                              decoration: TextDecoration.none))),
                      childWhenDragging: Container(),
                    ),
                    Draggable(
                      data: cantroller.smallalphabet[cantroller.i.value].small,
                      child: Obx(
                        () => Text(
                            (cantroller.smallalphabet[cantroller.i.value].isAccept ==
                                    true)
                                ? ""
                                : "${cantroller.smallalphabet[cantroller.i.value].small}",
                            style: GoogleFonts.titanOne(
                                color:
                                    cantroller.smallalphabet[cantroller.i.value].col,
                                fontSize: 150)),
                      ),
                      feedback: Obx(() => Text(
                          "${cantroller.smallalphabet[cantroller.i.value].small}",
                          style: GoogleFonts.titanOne(
                              color:
                                  cantroller.smallalphabet[cantroller.i.value].col,
                              fontSize: 150,
                              decoration: TextDecoration.none))),
                      childWhenDragging: Container(),
                    ),
                  ],
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
            Positioned(top: 80,left: 30,child: Container(height: 250,child: Lottie.asset('assets/lottie/teacher.json'))),
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
