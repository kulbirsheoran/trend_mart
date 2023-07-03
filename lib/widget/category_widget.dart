import 'package:emartapp/constant/string.dart';
import 'package:emartapp/ui/screen/bottom_tabbar_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// Widget categoryWidget(){
//   return Column(
//     children: [
//       40.heightBox,
//       //Image.asset("assets/images/emartlogo.png",).box.white.size(77, 77).padding(EdgeInsets.all(8)).rounded.make(),
//       10.heightBox,
//       Align(
//         alignment: Alignment.centerLeft,
//       child: categories.text.white.bold.size(20).make(),)
//     ],
//   );
// }
Widget categoryWidget() {
  return Row(
    children: [
      IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {HomeScreen();
          // Handle back arrow press here
        },
      ),
      10.widthBox,
      categories.text.white.bold.size(20).make(),
    ],
  );
}