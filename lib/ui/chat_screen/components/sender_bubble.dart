import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/constant/firebase_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intL.dart' as intl;

Widget senderBubble(DocumentSnapshot data){
  var t = data['created_on'] == null? DateTime.now(): data['created_on'].toDate();
  var time = intl.DateFormat("h:mma").format(t);
  return    Directionality(
    textDirection: data['uid'] == currentUser!.uid? TextDirection.rtl:TextDirection.ltr,
    child: Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: data['uid'] == currentUser!.uid? Colors.red:Colors.grey,

          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft:Radius.circular(20),)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '${data['msg']}'.text.white.size(16).make(),
          10.heightBox,
          time.text.color(Colors.white.withOpacity(0.5)).make()
        ],
      ),
    ),
  );
}