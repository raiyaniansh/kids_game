import 'package:get/get.dart';

class MainCantroller extends GetxController
{
  RxBool balloon = true.obs;

  void balloons()
  {
    balloon.value=false;
  }
  void tballoons()
  {
    balloon.value=true;
  }
}