import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kids_game/screen/mainscreen/cantroller/main_cantroller.dart';
import 'package:kids_game/screen/shapematch/cantroller/shapeMCantroller.dart';
import 'package:lottie/lottie.dart';

class ShapeMScreen extends StatefulWidget {
  const ShapeMScreen({Key? key}) : super(key: key);

  @override
  State<ShapeMScreen> createState() => _ShapeMScreenState();
}

class _ShapeMScreenState extends State<ShapeMScreen> {
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

  ShapeMCantroller cantroller = Get.put(ShapeMCantroller());
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
            Container(
              margin: EdgeInsets.only(top: 45,right: 30,bottom: 10,left: 30),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.black)),
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: cantroller.qualist.length,
                        itemBuilder: (context, index) => Container(
                          width: 85,
                          height: 85,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Draggable(
                            data: cantroller.qualist[index].key,
                            feedback: Image.asset(height: 100,
                                "assets/image/${cantroller.qualist[index].name}.png"),
                            child: Image.asset(
                                "assets/image/${cantroller.qualist[index].name}.png"),
                          ),
                        ),
                      ),
                  ),
                  SizedBox(width: 30,),
                  Expanded(
                    child: ListView.builder(
                        itemCount: cantroller.qualist.length,
                        itemBuilder: (context, index) => DragTarget(
                          onAccept: (data) {
                            cantroller.anslist[index].isAccepted=true;
                          },
                          onWillAccept: (data) {
                            return data == cantroller.anslist[index].key;
                          },
                          builder: (context, candidateData, rejectedData) => Obx(
                            () => Center(
                              child: Container(
                                width: 100,
                                height: 75,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(color: cantroller.anslist[index].isAccepted==true?cantroller.anslist[index].col!.withOpacity(0.20):Colors.red.withOpacity(0.20),border: Border.all(color: cantroller.anslist[index].isAccepted==true?cantroller.anslist[index].col!:Colors.red.withOpacity(0.20),),borderRadius: BorderRadius.circular(10)),
                                alignment: Alignment.center,
                                child: Text("${cantroller.anslist[index].name}",style: TextStyle(color: cantroller.anslist[index].isAccepted==true?cantroller.anslist[index].col:Colors.red,fontWeight: FontWeight.bold,fontSize: 25)),
                              ),
                            ),
                          ),
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
