import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kids_game/screen/mainhome/cantroller/mainhome_cantroller.dart';
import 'package:lottie/lottie.dart';

class MianHomeScreen extends StatefulWidget {
  const MianHomeScreen({Key? key}) : super(key: key);

  @override
  State<MianHomeScreen> createState() => _MianHomeScreenState();
}

class _MianHomeScreenState extends State<MianHomeScreen> {
  MainHomeCaantroller cantroller = Get.put(MainHomeCaantroller());

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    cantroller.initSong();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset('assets/image/fbg1.jpg', fit: BoxFit.cover),
            ),
            Positioned(
              right: -250,
              bottom: -70,
              child: Container(
                height: 700,
                child: Lottie.asset('assets/lottie/tree.json'),
              ),
            ),
            Positioned(
              right: 180,
              bottom: -50,
              child: Container(
                height: 600,
                child: Lottie.asset('assets/lottie/tree.json'),
              ),
            ),
            Positioned(
              left: -350,
              bottom: -50,
              child: Container(
                height: 600,
                child: Lottie.asset('assets/lottie/tree.json'),
              ),
            ),
            Positioned(
              left: -150,
              bottom: -50,
              child: Container(
                height: 500,
                child: Lottie.asset('assets/lottie/tree.json'),
              ),
            ),
            Positioned(
              right: 25,
              bottom: -50,
              child: Container(
                height: 500,
                child: Lottie.asset('assets/lottie/tree.json'),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 15,
              child: Container(
                height: 200,
                child: Lottie.asset('assets/lottie/tiger.json'),
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
                        cantroller.volume();
                      },
                      onWillAccept: (data) {
                        return data == 'music';
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Obx(() => Icon(
                              cantroller.i.value == 1
                                  ? Icons.volume_up_sharp
                                  : Icons.volume_off,
                            ));
                      },
                    ),
                    Expanded(child: SizedBox()),
                    Draggable(
                      data: 'music',
                      axis: Axis.horizontal,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.90),
                            borderRadius: BorderRadius.circular(5)),
                        child: Obx(() => Icon(
                            cantroller.i.value == 1
                                ? Icons.volume_off
                                : Icons.volume_up_sharp,
                            color: Colors.white)),
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
            Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(onTap: () {
                Get.toNamed('home');
              },child: Container(width: 175,child: Image.asset('assets/image/play.jpg')))
            ),
          ],
        ),
      ),
    );
  }
}
