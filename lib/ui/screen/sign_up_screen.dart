import 'dart:async';

import 'package:emartapp/constant/color.dart';
import 'package:emartapp/constant/list.dart';
import 'package:emartapp/constant/string.dart';
import 'package:emartapp/widget/applogo_widget.dart';
import 'package:emartapp/widget/button.dart';
import 'package:emartapp/widget/custom_textfield.dart';
import 'package:emartapp/widget/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isCheck = false;
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
                    SignUpWidget()

                        //10.heightBox
                        // 'Sign up to eMart'.text.make()
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
          Positioned(
            top: 165,
            left: 40,
            right: 40,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  customTextField(hint: namehint, title: name),
                  5.heightBox,
                  customTextField(hint: email, title: email),
                  5.heightBox,
                  customTextField(hint: password, title: password),
                  5.heightBox,
                  customTextField(
                      hint: confirmpassword, title: confirmpassword),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgotpassword.text.make())),

                  5.heightBox,

                  Row(
                    children: [
                      Checkbox(
                          checkColor: Colors.redAccent,
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue!;
                            });

                          }),
                      10.widthBox,
                      Expanded(
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: 'I agree to the',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                              TextSpan(
                                  text: termAndCondition,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red)),
                              TextSpan(
                                  text: privacypolicy ,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey))
                        ])),
                      ),

                    ],
                  ),
                  5.heightBox.box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  Button(
                      Color: isCheck == true? Colors.red: greyColor,
                      title: signup,
                      textColor: Colors.white,
                      onPress: () {})
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  10.heightBox,
                  RichText(text: const TextSpan(
                    children: [
                      TextSpan(
                        text: alreadyHaveAccount,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )
                      ),
                      TextSpan(
                          text: login,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          )
                      )
                    ]
                  )).onTap(() {
                    Get.back();
                  })
                ],
              ).box.white.rounded.padding(EdgeInsets.all(16)).shadow2xl.make(),
            ),
          )
        ],
      ),
    );
  }
}
