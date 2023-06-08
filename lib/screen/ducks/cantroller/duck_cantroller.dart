import 'package:get/get.dart';
import 'package:kids_game/screen/ducks/modal/duck_modal.dart';

class DuckCantoller extends GetxController
{
  RxList<duckModal> ducklist = <duckModal>[
    duckModal(img: 'yellowduck',isAccpted: false,),
    duckModal(img: 'blueduck',isAccpted: false),
    duckModal(img: 'greenduck',isAccpted: false),
    duckModal(img: 'lightblueduck',isAccpted: false),
    duckModal(img: 'pinkduck',isAccpted: false),
    duckModal(img: 'greenduck',isAccpted: false),
    duckModal(img: 'lightblueduck',isAccpted: false),
    duckModal(img: 'blueduck',isAccpted: false),
    duckModal(img: 'yellowduck',isAccpted: false,),
    duckModal(img: 'pinkduck',isAccpted: false),
    duckModal(img: 'greenduck',isAccpted: false),
    duckModal(img: 'blueduck',isAccpted: false),
    duckModal(img: 'lightblueduck',isAccpted: false),
    duckModal(img: 'yellowduck',isAccpted: false,),
    duckModal(img: 'pinkduck',isAccpted: false),
    duckModal(img: 'lightblueduck',isAccpted: false),
  ].obs;
}