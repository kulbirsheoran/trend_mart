import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget detailsCard({width,String?count,String?title}) {
  return Column(
    children: [
      '00'.text.size(16).make(),
      5.heightBox,
      'In your cart'.text.size(16).make(),

    ],
  ).box.white.rounded.width(width).height(50).make();

}
