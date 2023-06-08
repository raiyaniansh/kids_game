import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:kids_game/screen/123/modal/123_modal.dart';

class aCantroller{
  RxInt i = 0.obs;
  RxBool cel = false.obs;

  RxList<Amodal> alphabet = <Amodal>[
    Amodal(number: '1',col: Colors.red,isAccept: false),
    Amodal(number: '2',col: Colors.blue,isAccept: false,),
    Amodal(number: '3',col: Colors.green,isAccept: false),
    Amodal(number: '4',col: Colors.teal,isAccept: false),
    Amodal(number: '5',col: Colors.purple,isAccept: false),
    Amodal(number: '6',col: Colors.black,isAccept: false),
    Amodal(number: '7',col: Colors.cyan,isAccept: false),
    Amodal(number: '8',col: Colors.deepOrangeAccent,isAccept: false),
    Amodal(number: '9',col: Colors.lightGreen,isAccept: false),
    Amodal(number: '0',col: Colors.purple,isAccept: false),
  ].obs;

  void changeIndex()
  {
    if(i<alphabet.length)
    {
      i++;
    }
    else
    {
      i.value=0;
    }
  }
}