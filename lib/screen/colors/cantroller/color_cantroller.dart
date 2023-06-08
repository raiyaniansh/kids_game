import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids_game/screen/colors/modal/color_modal.dart';

class ColorCantroller extends GetxController
{
  RxList<ColorModal> collist = <ColorModal>[
    ColorModal(col: Colors.red,name: "Red"),
    ColorModal(col: Colors.teal,name: "Teal"),
    ColorModal(col: Colors.black,name: "Black"),
    ColorModal(col: Colors.orange,name: "Orange"),
    ColorModal(col: Colors.indigo,name: "Indigo"),
    ColorModal(col: Colors.green,name: "Green"),
    ColorModal(col: Colors.purple,name: "Purple"),
    ColorModal(col: Colors.amber,name: "Amber"),
    ColorModal(col: Colors.cyan,name: "Cyan"),
    ColorModal(col: Colors.blue,name: "Blue"),
  ].obs;

  RxList<ColorModal> colqlist = <ColorModal>[
    ColorModal(col: Colors.teal,name: "Teal"),
    ColorModal(col: Colors.black,name: "Black"),
    ColorModal(col: Colors.purple,name: "Purple"),
    ColorModal(col: Colors.orange,name: "Orange"),
    ColorModal(col: Colors.cyan,name: "Cyan"),
    ColorModal(col: Colors.blue,name: "Blue"),
    ColorModal(col: Colors.indigo,name: "Indigo"),
    ColorModal(col: Colors.amber,name: "Amber"),
    ColorModal(col: Colors.red,name: "Red"),
    ColorModal(col: Colors.green,name: "Green"),
  ].obs;
}