import 'dart:async';

import 'package:emartapp/constant/color.dart';
import 'package:emartapp/constant/list.dart';
import 'package:emartapp/constant/string.dart';
import 'package:emartapp/ui/screen/home.dart';
import 'package:emartapp/ui/screen/sign_up_screen.dart';
import 'package:emartapp/widget/applogo_widget.dart';
import 'package:emartapp/widget/button.dart';
import 'package:emartapp/widget/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                child: Column(
                  children: [
                    appLogoWidget()
                    .centered()
                        .box
                        .color(redColor)
                        .size(MediaQuery.of(context).size.width,
                            MediaQuery.of(context).size.height / 3)
                        .make(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(top: 165,left: 40,right: 40,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  customTextField(hint: emailHint,title: email),
                  5.heightBox,
                  customTextField(hint: passwordHint, title: password),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgotpassword.text.make())),
                  5.heightBox,
                  Button(
                    Color: Colors.redAccent,
                    title: login,
                    textColor: Colors.white,
                    onPress: (){
                      Get.to(()=>Home());
                    },
                  ).box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAccount.text.color(Colors.grey).make(),
                  5.heightBox,
                  Button(
                    Color: goldenColor,
                    textColor: Colors.red,
                    title: signup,
                  onPress: (){
                      Get.to(()=>const SignUp());
                  }
                  )
                  .box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  loginwith.text.color(Colors.grey).make(),
                  5.heightBox,
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children:
                      List.generate(3, (index) =>CircleAvatar(radius: 25,
                        child:socialIconList[index] ,
                      ))

                  )
                ],
              ).box.white.rounded.padding(EdgeInsets.all(16)).shadow2xl.make(),
            ),
          )
        ],
      ),
    );
  }
}
