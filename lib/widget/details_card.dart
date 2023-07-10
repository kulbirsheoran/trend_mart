import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget detailsCard({width,required String ?count,String?title}) {
  return Column(
    children: [
      count!.text.size(16).make(),
      5.heightBox,
      title!.text.size(16).make(),

    ],
  ).box.white.rounded.width(width).height(50).make();

}
