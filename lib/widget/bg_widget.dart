import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

  Widget bgWidget(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height*0.3,
    decoration:  const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bgimage.jpg'), fit: BoxFit.cover)),
  );
}
