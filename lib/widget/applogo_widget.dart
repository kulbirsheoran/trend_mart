import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

Widget appLogoWidget(){
  return Column(
    children: [
      40.heightBox,
      Image.asset("assets/images/emartlogo.png",).box.white.size(77, 77).padding(EdgeInsets.all(8)).rounded.make(),
      10.heightBox,
      'Log In to TrendMart'.text.white.bold.size(20).make()
    ],
  );
}