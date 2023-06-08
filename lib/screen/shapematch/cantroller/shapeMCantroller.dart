import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids_game/screen/shapematch/modal/shapeMModal.dart';

class ShapeMCantroller extends GetxController
{
  RxList<ShapMModal> qualist = <ShapMModal>[
    ShapMModal(name: 'taiangle',isAccepted: false,col: Colors.green,key: 'ta'),
    ShapMModal(name: 'circle',isAccepted: false,col: Colors.blue.shade900,key: 'ci'),
    ShapMModal(name: 'cross',isAccepted: false,col: Colors.tealAccent,key: 'cr'),
    ShapMModal(name: 'ellipse',isAccepted: false,col: Colors.indigo,key: 'el'),
    ShapMModal(name: 'heart',isAccepted: false,col: Colors.black,key: 'hr'),
    ShapMModal(name: 'star',isAccepted: false,col: Colors.grey.shade400,key: 'st'),
    ShapMModal(name: 'rhombus',isAccepted: false,col: Colors.yellow,key: 'rh'),
    ShapMModal(name: 'kite',isAccepted: false,col: Colors.deepOrangeAccent,key: 'ki'),
    ShapMModal(name: 'hexagon',isAccepted: false,col: Colors.blue,key: 'he'),
  ].obs;

  RxList<ShapMModal> anslist = <ShapMModal>[
    ShapMModal(name: 'heart',isAccepted: false,col: Colors.black,key: 'hr'),
    ShapMModal(name: 'rhombus',isAccepted: false,col: Colors.yellow,key: 'rh'),
    ShapMModal(name: 'cross',isAccepted: false,col: Colors.tealAccent,key: 'cr'),
    ShapMModal(name: 'kite',isAccepted: false,col: Colors.deepOrangeAccent,key: 'ki'),
    ShapMModal(name: 'hexagon',isAccepted: false,col: Colors.blue,key: 'he'),
    ShapMModal(name: 'circle',isAccepted: false,col: Colors.blue.shade900,key: 'ci'),
    ShapMModal(name: 'ellipse',isAccepted: false,col: Colors.indigo,key: 'el'),
    ShapMModal(name: 'taiangle',isAccepted: false,col: Colors.green,key: 'ta'),
    ShapMModal(name: 'star',isAccepted: false,col: Colors.grey.shade400,key: 'st'),
  ].obs;

}