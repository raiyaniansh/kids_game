import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids_game/screen/matchcolor/modal/colorm_modal.dart';

class ColorMCantroller extends GetxController
{
  RxInt i=0.obs;

  RxList<ColorMModal> collist = <ColorMModal>[
    ColorMModal(col: Colors.red,name: "Red"),
    ColorMModal(col: Colors.teal,name: "Teal"),
    ColorMModal(col: Colors.black,name: "Black"),
    ColorMModal(col: Colors.orange,name: "Orange"),
    ColorMModal(col: Colors.indigo,name: "Indigo"),
    ColorMModal(col: Colors.green,name: "Green"),
    ColorMModal(col: Colors.purple,name: "Purple"),
    ColorMModal(col: Colors.amber,name: "Amber"),
    ColorMModal(col: Colors.cyan,name: "Cyan"),
    ColorMModal(col: Colors.blue,name: "Blue"),
  ].obs;

  RxList<ColorMModal> colalist = <ColorMModal>[
    ColorMModal(col: Colors.teal,name: "Teal"),
    ColorMModal(col: Colors.indigo,name: "Indigo"),
    ColorMModal(col: Colors.black,name: "Black"),
    ColorMModal(col: Colors.red,name: "Red"),
    ColorMModal(col: Colors.amber,name: "Amber"),
    ColorMModal(col: Colors.cyan,name: "Cyan"),
    ColorMModal(col: Colors.green,name: "Green"),
    ColorMModal(col: Colors.purple,name: "Purple"),
    ColorMModal(col: Colors.blue,name: "Blue"),
    ColorMModal(col: Colors.orange,name: "Orange"),
  ].obs;
}