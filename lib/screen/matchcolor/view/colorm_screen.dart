import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_game/screen/matchcolor/cantroller/colorm_cantroller.dart';
import 'package:lottie/lottie.dart';

import '../../mainscreen/cantroller/main_cantroller.dart';

class ColorMScreen extends StatefulWidget {
  const ColorMScreen({Key? key}) : super(key: key);

  @override
  State<ColorMScreen> createState() => _ColorMScreenState();
}

class _ColorMScreenState extends State<ColorMScreen> {
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

  ColorMCantroller cantroller = Get.put(ColorMCantroller());
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
            Column(
              children: [
                Container(
                  height: 75,
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 45),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: Obx(
                    () => Draggable(
                      data: cantroller.collist[cantroller.i.value].name,
                      feedback: Text("${cantroller.collist[cantroller.i.value].name}", style: GoogleFonts.titanOne(color: Colors.black,decoration: TextDecoration.none,fontWeight: FontWeight.bold, fontSize: 30)),
                      child: Text("${cantroller.collist[cantroller.i.value].name}", style: GoogleFonts.titanOne(fontWeight: FontWeight.bold, fontSize: 30)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 230,
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,childAspectRatio: 1.4),
                    itemBuilder: (context, index) => DragTarget(
                      onAccept: (data) {
                        if(cantroller.i.value==cantroller.colalist.length-1)
                          {
                            Navigator.pushReplacementNamed(context, 'com');
                            cantroller.i--;
                          }
                        else
                          {
                            cantroller.i++;
                          }
                      },
                      onWillAccept: (data) {
                        return data==cantroller.colalist[index].name;
                      },
                      builder: (context, candidateData, rejectedData) => Container(
                        margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                        decoration:
                            BoxDecoration(color: cantroller.colalist[index].col),
                      ),
                    ),
                    itemCount: cantroller.colalist.length,
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
