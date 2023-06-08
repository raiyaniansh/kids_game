import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kids_game/screen/123/view/123_view.dart';
import 'package:kids_game/screen/abc/view/abc_screen.dart';
import 'package:kids_game/screen/abc_main/view/abc_m_screen.dart';
import 'package:kids_game/screen/colormain/view/color_main_screen.dart';
import 'package:kids_game/screen/colors/view/colors_screen.dart';
import 'package:kids_game/screen/ducks/view/duck_screen.dart';
import 'package:kids_game/screen/game_com/view/com_screen.dart';
import 'package:kids_game/screen/mainhome/view/mainhome_screen.dart';
import 'package:kids_game/screen/mainscreen/view/main_screen.dart';
import 'package:kids_game/screen/matchcolor/view/colorm_screen.dart';
import 'package:kids_game/screen/maths/view/maths_screen.dart';
import 'package:kids_game/screen/shape/view/shape_screen.dart';
import 'package:kids_game/screen/shape_main/view/shape_main_screen.dart';
import 'package:kids_game/screen/shapematch/view/shapeScreen.dart';
import 'package:kids_game/screen/shapes/view/shapes_screen.dart';
import 'package:kids_game/screen/splash/view/splash_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) => SplashScreen(),
        'mainhome':(p0) => MianHomeScreen(),
        'home':(p0) => HomeScreen(),
        'text':(p0) => AbcMScreen(),
        'abc':(p0) => AbcScreen(),
        '123':(p0) => AScreen(),
        'com':(p0) => ComplateScreen(),
        'shapeMain':(p0) => ShapeMainScreen(),
        'shape':(p0) => ShapeScreen(),
        'shapes':(p0) => ShapesScreen(),
        'shapem':(p0) => ShapeMScreen(),
        'duck':(p0) => DuckScreen(),
        'color':(p0) => ColorScreen(),
        'colormain':(p0) => ColorMainScreen(),
        'colorm':(p0) => ColorMScreen(),
        'math':(p0) => MathScreen(),
      },
    ),
  );
}
