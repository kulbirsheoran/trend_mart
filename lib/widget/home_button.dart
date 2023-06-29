import 'package:emartapp/constant/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

Widget HomeButton(){
  return Column(
    children: [
      Image.asset('assets/images/todayDeal.jpg',width: 50,),
      5.heightBox,
      todaydeal.text.fontWeight(FontWeight.bold).color(CupertinoColors.black).make(),
    ],
  ).box.rounded.white.make();
}