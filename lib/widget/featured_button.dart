import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

Widget featuredButton({String? title, icon,width,height}){
  return Row(
    children: [
      icon, // image
     10.widthBox,
      title!.text.color(Vx.black).make()
    ],
  ).box.size(width,height).margin(const EdgeInsets.symmetric(horizontal: 4)).white.roundedSM.make();
}