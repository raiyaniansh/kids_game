import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids_game/screen/abc/modal/abc_modal.dart';

class AbcCantroller extends GetxController {
  RxInt i = 0.obs;
  RxBool cel = false.obs;

  RxList<AbcModal> alphabet = <AbcModal>[
    AbcModal(alphabets: 'A', col: Colors.red, isAccept: false, small: 'a'),
    AbcModal(alphabets: 'B', col: Colors.blue, isAccept: false, small: 'b'),
    AbcModal(alphabets: 'C', col: Colors.green, isAccept: false, small: 'c'),
    AbcModal(alphabets: 'D', col: Colors.teal, isAccept: false, small: 'd'),
    AbcModal(alphabets: 'E', col: Colors.purple, isAccept: false, small: 'e'),
    AbcModal(alphabets: 'F', col: Colors.black, isAccept: false, small: 'f'),
    AbcModal(alphabets: 'G', col: Colors.cyan, isAccept: false, small: 'g'),
    AbcModal(alphabets: 'H', col: Colors.deepOrangeAccent, isAccept: false, small: 'h'),
    AbcModal(alphabets: 'I', col: Colors.lightGreen, isAccept: false, small: 'i'),
    AbcModal(alphabets: 'J', col: Colors.purple, isAccept: false, small: 'j'),
    AbcModal(alphabets: 'K', col: Colors.indigo, isAccept: false, small: 'k'),
    AbcModal(alphabets: 'L', col: Colors.red, isAccept: false, small: 'l'),
    AbcModal(alphabets: 'M', col: Colors.blue, isAccept: false, small: 'm'),
    AbcModal(alphabets: 'N', col: Colors.green, isAccept: false, small: 'n'),
    AbcModal(alphabets: 'O', col: Colors.teal, isAccept: false, small: 'o'),
    AbcModal(alphabets: 'P', col: Colors.purple, isAccept: false, small: 'p'),
    AbcModal(alphabets: 'Q', col: Colors.black, isAccept: false, small: 'q'),
    AbcModal(alphabets: 'R', col: Colors.cyan, isAccept: false, small: 'r'),
    AbcModal(alphabets: 'S', col: Colors.deepOrangeAccent, isAccept: false, small: 's'),
    AbcModal(alphabets: 'T', col: Colors.lightGreen, isAccept: false, small: 't'),
    AbcModal(alphabets: 'U', col: Colors.purple, isAccept: false, small: 'u'),
    AbcModal(alphabets: 'V', col: Colors.indigo, isAccept: false, small: 'v'),
    AbcModal(alphabets: 'W', col: Colors.red, isAccept: false, small: 'w'),
    AbcModal(alphabets: 'X', col: Colors.blue, isAccept: false, small: 'x'),
    AbcModal(alphabets: 'Y', col: Colors.green, isAccept: false, small: 'y'),
    AbcModal(alphabets: 'Z', col: Colors.purple, isAccept: false, small: 'z'),
  ].obs;
  RxList<AbcModal> smallalphabet = <AbcModal>[
    AbcModal(col: Colors.red, isAccept: false, small: 'a'),
    AbcModal(col: Colors.blue, isAccept: false, small: 'b'),
    AbcModal(col: Colors.green, isAccept: false, small: 'c'),
    AbcModal(col: Colors.teal, isAccept: false, small: 'd'),
    AbcModal(col: Colors.purple, isAccept: false, small: 'e'),
    AbcModal(col: Colors.black, isAccept: false, small: 'f'),
    AbcModal(col: Colors.cyan, isAccept: false, small: 'g'),
    AbcModal(col: Colors.deepOrangeAccent, isAccept: false, small: 'h'),
    AbcModal(col: Colors.lightGreen, isAccept: false, small: 'i'),
    AbcModal(col: Colors.purple, isAccept: false, small: 'j'),
    AbcModal(col: Colors.indigo, isAccept: false, small: 'k'),
    AbcModal(col: Colors.red, isAccept: false, small: 'l'),
    AbcModal(col: Colors.blue, isAccept: false, small: 'm'),
    AbcModal(col: Colors.green, isAccept: false, small: 'n'),
    AbcModal(col: Colors.teal, isAccept: false, small: 'o'),
    AbcModal(col: Colors.purple, isAccept: false, small: 'p'),
    AbcModal(col: Colors.black, isAccept: false, small: 'q'),
    AbcModal(col: Colors.cyan, isAccept: false, small: 'r'),
    AbcModal(col: Colors.deepOrangeAccent, isAccept: false, small: 's'),
    AbcModal(col: Colors.lightGreen, isAccept: false, small: 't'),
    AbcModal(col: Colors.purple, isAccept: false, small: 'u'),
    AbcModal(col: Colors.indigo, isAccept: false, small: 'v'),
    AbcModal(col: Colors.red, isAccept: false, small: 'w'),
    AbcModal(col: Colors.blue, isAccept: false, small: 'x'),
    AbcModal(col: Colors.green, isAccept: false, small: 'y'),
    AbcModal(col: Colors.purple, isAccept: false, small: 'z'),
  ].obs;

  void changeIndex() {
    if (i < alphabet.length) {
      i++;
    }
    else {
      i.value = 0;
    }
  }
}