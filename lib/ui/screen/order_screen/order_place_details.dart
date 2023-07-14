import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

Widget orderPlaceDetails({ d2, d1,  title1,   title2}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            '$title1'.text.fontWeight(FontWeight.bold).make(),
            //"${data?['order_code']}".text.make()
            '$d1'.text.red500.make()
          ],
        ),
        SizedBox(
          width: 130,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              '$title2'.text.fontWeight(FontWeight.bold).make(),
             // '${data?['shipping_method']}'.text.make()
              '$d2'.text.make(),



            ],
          ),
        )
      ],
    ),
  );
}