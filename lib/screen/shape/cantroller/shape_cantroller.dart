import 'package:get/get.dart';
import 'package:kids_game/screen/shape/modal/shape_modal.dart';

class ShapeCantroller extends GetxController
{
  RxInt i =0.obs;

  RxList<ShapeModal> shapelist = <ShapeModal>[
    ShapeModal(shape: 'assets/image/circle.png',key: 'circle'),
    ShapeModal(shape: 'assets/image/star.png',key: 'star'),
    ShapeModal(shape: 'assets/image/heart.png',key: 'heart'),
    ShapeModal(shape: 'assets/image/star.png',key: 'star'),
    ShapeModal(shape: 'assets/image/rhombus.png',key: 'rhombus'),
    ShapeModal(shape: 'assets/image/star.png',key: 'star'),
    ShapeModal(shape: 'assets/image/rhombus.png',key: 'rhombus'),
    ShapeModal(shape: 'assets/image/circle.png',key: 'circle'),
    ShapeModal(shape: 'assets/image/rhombus.png',key: 'rhombus'),
    ShapeModal(shape: 'assets/image/star.png',key: 'star'),
    ShapeModal(shape: 'assets/image/rhombus.png',key: 'rhombus'),
    ShapeModal(shape: 'assets/image/heart.png',key: 'heart'),
    ShapeModal(shape: 'assets/image/rhombus.png',key: 'rhombus'),
    ShapeModal(shape: 'assets/image/heart.png',key: 'heart'),
    ShapeModal(shape: 'assets/image/star.png',key: 'star'),
    ShapeModal(shape: 'assets/image/heart.png',key: 'heart'),
    ShapeModal(shape: 'assets/image/circle.png',key: 'circle'),
    ShapeModal(shape: 'assets/image/heart.png',key: 'heart'),
    ShapeModal(shape: 'assets/image/circle.png',key: 'circle'),
    ShapeModal(shape: 'assets/image/heart.png',key: 'heart'),
    ShapeModal(shape: 'assets/image/circle.png',key: 'circle'),
    ShapeModal(shape: 'assets/image/rhombus.png',key: 'rhombus'),
  ].obs;
}