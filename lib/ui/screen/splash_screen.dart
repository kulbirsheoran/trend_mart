import 'package:emartapp/constant/color.dart';
import 'package:emartapp/constant/string.dart';
import 'package:emartapp/widget/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
            // Image.asset('assets/images/splashlogo.jpg',
            //    width: 300, alignment: Alignment.topLeft),
         300.heightBox,
            appLogoWidget(),
            10.heightBox,
            appName.text.size(20).white.make(),
            5.heightBox,
            version.text.size(12).white.make(),
            const Spacer(),
            credit.text.size(12).white.make(),
            30.heightBox,

          ],
        ),
      ),
    );
  }
}
