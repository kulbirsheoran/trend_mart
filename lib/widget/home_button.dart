import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

Widget homeButton({width,height,icon,String? title,onPress, }){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
     icon, // image
      5.heightBox,
      title!.text.make(),
    ],
  ).box.rounded.white.size(width,height).make().card.rounded.make().onTap(onPress);
}