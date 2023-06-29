import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

Widget SignUpWidget(){
  return  Column(
    children: [
      40.heightBox,
      Image.asset("assets/images/emartlogo.png",).box.white.size(77, 77).padding(EdgeInsets.all(8)).rounded.make(),
      10.heightBox,
      'Join in to eMart'.text.white.bold.size(20).make()
    ],
  );
}