import 'package:emartapp/constant/color.dart';
import 'package:emartapp/constant/firebase_const.dart';
import 'package:emartapp/constant/string.dart';
import 'package:emartapp/ui/screen/home.dart';
import 'package:emartapp/ui/screen/login_screen.dart';
import 'package:emartapp/widget/applogo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 void changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      // Get.to(() => const LoginScreen());
      auth.authStateChanges().listen((User? user) {
        if(user == null && mounted){
          Get.to(()=>const LoginScreen());
        }else{
          Get.to(()=>const Home());
        }
      });
    });
  }

  @override
 void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            // 50.heightBox,
            //  Image.asset('assets/images/bgsplashlogo.jpg',fit: BoxFit.cover,
            //   alignment: Alignment.topLeft),
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
