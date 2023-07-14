import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget orderStatus({icon,color,title,showDone}) {
  return ListTile(
    leading:  Icon(icon,
      color: color,
    ).
    box.border(color: color).roundedFull.p4.make(),
    trailing: SizedBox(
      height: 100,
      width: 120,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          '$title'.text.color(Colors.grey).make(),
          showDone? const Icon(
            Icons.done, color: Colors.black,
          )
              :Container(),
        ]
      ),
    ),
  );
}
