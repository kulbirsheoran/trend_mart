import 'package:emartapp/controller/auth_controller.dart';
import 'package:emartapp/ui/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child:  Padding(
        padding: const EdgeInsets.only(left: 80),
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white)),
            onPressed: () async {
              await Get.put(
                  AuthController().signOutMethod(context));
              Get.offAll(LoginScreen());
            },
            child: 'Log out'.text.white.make()),
      ),
    );
  }
}
