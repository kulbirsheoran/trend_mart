import 'package:emartapp/ui/screen/bottom_tabbar_screen/category_detial.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:velocity_x/velocity_x.dart';

Widget homeButton({width,height,icon,String? title,onPress, }){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
     icon, // image
      5.heightBox,
      title!.text.make().onTap(() {
        Get.to(()=>
            CategoryDetail(title: title)
        );
      })
    ],
  ).box.rounded.white.size(width,height).make().card.rounded.make().onTap(onPress);
}