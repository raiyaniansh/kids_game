import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_game/screen/colors/cantroller/color_cantroller.dart';
import 'package:lottie/lottie.dart';

import '../../mainscreen/cantroller/main_cantroller.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({Key? key}) : super(key: key);

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
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
  ColorCantroller cantroller = Get.put(ColorCantroller());
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
              child: Image.asset(
                  'assets/image/bg.jpg',
                  fit: BoxFit.cover),
            ),
            Container(
              margin: EdgeInsets.only(top: 45,right: 30,bottom: 10,left: 30),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.black)),
              child: Row  (
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cantroller.collist.length,
                      itemBuilder: (context, index) => Container(
                        width: 85,
                        height: 85,
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Draggable(
                          data: cantroller.colqlist[index].name,
                          feedback: Text("${cantroller.colqlist[index].name}",style: GoogleFonts.titanOne(color: Colors.black,decoration: TextDecoration.none,fontSize: 20,fontWeight: FontWeight.bold)),
                          child: Text("${cantroller.colqlist[index].name}",style: GoogleFonts.titanOne(color: Colors.black,decoration: TextDecoration.none,fontSize: 25,fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cantroller.collist.length,
                      itemBuilder: (context, index) => DragTarget(
                        onAccept: (data) {
                          cantroller.collist[index].isAccepted=true;
                        },
                        onWillAccept: (data) {
                          return data == cantroller.collist[index].name;
                        },
                        builder: (context, candidateData, rejectedData) => Obx(
                              () => Center(
                            child: Container(
                              width: 100,
                              height: 75,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(color: cantroller.collist[index].isAccepted==true?cantroller.collist[index].col!.withOpacity(0.20):Colors.red.withOpacity(0.20),border: Border.all(color: cantroller.collist[index].isAccepted==true?cantroller.collist[index].col!:Colors.red.withOpacity(0.20),),borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: Text("${cantroller.collist[index].name}",style: GoogleFonts.titanOne(color: cantroller.collist[index].isAccepted==true?cantroller.collist[index].col:Colors.red,fontWeight: FontWeight.bold,fontSize: 25)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(left: 20,bottom: 10,child: Lottie.asset('assets/lottie/color.json')),
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
