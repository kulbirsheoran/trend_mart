import 'package:emartapp/constant/color.dart';
import 'package:emartapp/ui/screen/login_screen.dart';
import 'package:emartapp/widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_button.dart';

Widget exitDialog(){
  return Dialog(
    child: SizedBox(
      height: 150,
      //width: 400,
      child: Column(
        children: [
          'Confirm'.text.red300.fontWeight(FontWeight.bold).size(18).make(),
          Divider(),
            10.heightBox,
          'Are you sure you want to exit'.text.size(16).black.make(),
          10.heightBox,
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
               // color:redColor,
                onPress: (){
                    Get.to(()=> LoginScreen());
                },

                title: 'yes'
              ),
              Button(

                 // color:redColor,
                  onPress: (){
                    Get.back();
                  },
                  title: 'No',
              )
            ],
          )
        ],
      ).box.red500.size(50, 80).roundedSM.make(),//
    )
  );//.box.white.size(50, 80).roundedSM.make();
}
//width,height,icon,String? title,onPress,