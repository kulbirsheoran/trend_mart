import 'package:emartapp/ui/screen/bottom_tabbar_screen/category_detial.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

Widget featuredButton({String? title, icon, width, height}) {
  return Row(
    children: [
      icon, // image
      10.widthBox,
      title!.text.color(Vx.black).make()
    ],
  )
      .box
      .size(width, height)
      .margin(const EdgeInsets.symmetric(horizontal: 4))
      .white
      .roundedSM
      .make().onTap(() {
        Get.to(()=>
        CategoryDetail(title: title)
        );
  });
}
