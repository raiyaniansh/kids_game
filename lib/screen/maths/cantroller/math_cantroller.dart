import 'dart:async';

import 'package:get/get.dart';
import 'package:kids_game/screen/maths/modal/math_modal.dart';

class MathCantroller extends GetxController
{
  RxInt i = 0.obs;
  RxInt con=0.obs;
  RxBool cel = false.obs;
  RxBool nav= false.obs;

  RxList<MathModal> qualist = <MathModal>[
    MathModal(qua: '2 + _ = 8',op1: '5',op2: '3',op3: '6',op4: '7'),
    MathModal(qua: '9 + 9 = _',op1: '17',op2: '10',op3: '18',op4: '19'),
    MathModal(qua: '20 - _ = 8',op1: '15',op2: '23',op3: '12',op4: '9'),
    MathModal(qua: '2 * 2 = _',op1: '5',op2: '3',op3: '4',op4: '8'),
    MathModal(qua: '32 / _ = 4',op1: '8',op2: '3',op3: '6',op4: '7'),
    MathModal(qua: '21 + _ = 28',op1: '5',op2: '3',op3: '6',op4: '7'),
    MathModal(qua: '100 + 10 = _',op1: '110',op2: '101',op3: '120',op4: '1010'),
    MathModal(qua: '_ - 5 = 19',op1: '24',op2: '23',op3: '26',op4: '27'),
    MathModal(qua: '14 * 2 = _',op1: '28',op2: '30',op3: '29',op4: '16'),
    MathModal(qua: '25 + 5 = _',op1: '35',op2: '30',op3: '36',op4: '37'),
    MathModal(qua: '_ * 5  = 20',op1: '5',op2: '4',op3: '3',op4: '2'),
  ].obs;

  RxList ans = [
    '6',
    '18',
    '12',
    '4',
    '7',
    '7',
    '110',
    '24',
    '28',
    '30',
    '4'
  ].obs;

  void Changeindex()
  {
    i++;
  }

  void answerop1()
  {
    if(ans[i.value]==qualist[i.value].op1)
      {
        con.value = 1;
        cel.value=true;
        Timer(Duration(seconds: 2), () {
          if(i.value==qualist.length-1)
          {
            nav.value=true;
          }
          else
          {
            Changeindex();
          }
          cel.value=false;
          con.value = 0;
        });
      }
  }

  void answerop2()
  {
    if(ans[i.value]==qualist[i.value].op2)
    {
      con.value = 2;
      cel.value=true;
      Timer(Duration(seconds: 2), () {
        if(i.value==qualist.length-1)
          {
            nav.value=true;
          }
        else
          {
            Changeindex();
          }
        cel.value=false;
        con.value = 0;
      });
    }
  }

  void answerop3()
  {
    if(ans[i.value]==qualist[i.value].op3)
    {
      con.value = 3;
      cel.value=true;
      Timer(Duration(seconds: 2), () {
        if(i.value==qualist.length-1)
        {
          nav.value=true;
        }
        else
        {
          Changeindex();
        }
        cel.value=false;
        con.value = 0;
      });
    }
  }

  void answerop4()
  {
    if(ans[i.value]==qualist[i.value].op4)
    {
      con.value = 4;
      cel.value=true;
      Timer(Duration(seconds: 2), () {
        if(i.value==qualist.length-1)
        {
          nav.value=true;
        }
        else
        {
          Changeindex();
        }
        cel.value=false;
        con.value = 0;
      });
    }
  }
}