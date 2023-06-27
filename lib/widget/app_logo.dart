import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

Widget appLogoWidget(){
  return Image.asset("assets/images/emartlogo.png").box.white.size(77, 77).padding(EdgeInsets.all(8)).rounded.make();
}