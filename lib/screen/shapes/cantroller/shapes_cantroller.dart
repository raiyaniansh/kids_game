import 'package:get/get.dart';
import 'package:kids_game/screen/shapes/modal/shapes_modal.dart';

class ShapesCantroller extends GetxController
{
  RxInt i = 0.obs;

  RxList<ShapesModal> shapelist = <ShapesModal>[
    ShapesModal(img: 'taiangle',isAccepted: false),
    ShapesModal(img: 'circle',isAccepted: false),
    ShapesModal(img: 'cross',isAccepted: false),
    ShapesModal(img: 'ellipse',isAccepted: false),
    ShapesModal(img: 'heart',isAccepted: false),
    ShapesModal(img: 'star',isAccepted: false),
    ShapesModal(img: 'rhombus',isAccepted: false),
    ShapesModal(img: 'kite',isAccepted: false),
    ShapesModal(img: 'hexagon',isAccepted: false),
  ].obs;

  void changeindex()
  {
    if(i<shapelist.length)
      {
        i++;
      }
    else
      {
        i.value=0;
      }
  }
}