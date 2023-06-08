import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_game/screen/maths/cantroller/math_cantroller.dart';
import 'package:lottie/lottie.dart';

import '../../mainscreen/cantroller/main_cantroller.dart';

class MathScreen extends StatefulWidget {
  const MathScreen({Key? key}) : super(key: key);

  @override
  State<MathScreen> createState() => _MathScreenState();
}

class _MathScreenState extends State<MathScreen> {
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
  MathCantroller cantroller = Get.put(MathCantroller());
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
                      data: cantroller.qualist[cantroller.i.value].qua,
                      feedback: Text("${cantroller.qualist[cantroller.i.value].qua}", style: GoogleFonts.goldman(color: Colors.black,decoration: TextDecoration.none,fontWeight: FontWeight.bold, fontSize: 30)),
                      child: Text("${cantroller.qualist[cantroller.i.value].qua}", style: GoogleFonts.goldman(fontWeight: FontWeight.bold, fontSize: 30)),
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        cantroller.answerop1();
                        if(cantroller.nav.value==true)
                          {
                            Navigator.pushReplacementNamed(context, 'com');
                          }
                      },
                      child: Obx(
                        () => Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 385,
                          height: 65,
                          decoration: BoxDecoration(
                            color: cantroller.con==1?Colors.green.withOpacity(0.80):Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: cantroller.con==1?Colors.green:Colors.black,)
                          ),
                          alignment: Alignment.center,
                          child: Text('${cantroller.qualist[cantroller.i.value].op1}',style:   GoogleFonts.goldman(color: cantroller.con==1?Colors.white:Colors.black,fontSize: 25,fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cantroller.answerop2();
                        if(cantroller.nav.value==true)
                        {
                          Navigator.pushReplacementNamed(context, 'com');
                        }
                      },
                      child: Obx(
                        () => Container(
                          margin: EdgeInsets.only(left: 10,right: 10),
                          width: 385,
                          height: 65,
                          decoration: BoxDecoration(
                              color: cantroller.con==2?Colors.green.withOpacity(0.80):Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: cantroller.con==2?Colors.green:Colors.black,)
                          ),
                          alignment: Alignment.center,
                          child: Text('${cantroller.qualist[cantroller.i.value].op2}',style: GoogleFonts.goldman(color: cantroller.con==2?Colors.white:Colors.black,fontSize: 25,fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        cantroller.answerop3();
                        if(cantroller.nav.value==true)
                        {
                          Navigator.pushReplacementNamed(context, 'com');
                        }
                      },
                      child: Obx(
                        () => Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 385,
                          height: 65,
                          decoration: BoxDecoration(
                              color: cantroller.con==3?Colors.green.withOpacity(0.80):Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: cantroller.con==3?Colors.green:Colors.black,)
                          ),
                          alignment: Alignment.center,
                          child: Text('${cantroller.qualist[cantroller.i.value].op3}',style:   GoogleFonts.goldman(color: cantroller.con==3?Colors.white:Colors.black,fontSize: 25,fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cantroller.answerop4();
                        if(cantroller.nav.value==true)
                        {
                          Navigator.pushReplacementNamed(context, 'com');
                        }
                      },
                      child: Obx(
                        () => Container(
                          margin: EdgeInsets.only(left: 10,right: 10),
                          width: 385,
                          height: 65,
                          decoration: BoxDecoration(
                              color: cantroller.con==4?Colors.green.withOpacity(0.80):Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: cantroller.con==4?Colors.green:Colors.black,)
                          ),
                          alignment: Alignment.center,
                          child: Text('${cantroller.qualist[cantroller.i.value].op4}',style:   GoogleFonts.goldman(color: cantroller.con==4?Colors.white:Colors.black,fontSize: 25,fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
              ],
            ),
            Obx(() => Container(height: double.infinity,width: double.infinity,child: cantroller.cel.value==true?Lottie.asset('assets/lottie/celebrate.json',fit: BoxFit.cover):Container(),)),
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
