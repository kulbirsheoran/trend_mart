import 'package:emartapp/constant/color.dart';
import 'package:emartapp/constant/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget Button({String? title, Color, textColor,onPress,}) {

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Color,
          padding: EdgeInsets.all(12)
    ),
      onPressed:onPress,
      child: title?.text.color(textColor).fontWeight(FontWeight.bold).make());
}
