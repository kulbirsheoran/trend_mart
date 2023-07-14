import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/service/firestore_service.dart';
import 'package:emartapp/ui/chat_screen/chat_screen.dart';
import 'package:emartapp/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: 'My Messages'
              .text
              .color(Colors.grey)
              .fontWeight(FontWeight.bold)
              .make()),
      body: StreamBuilder(
        stream: FireStoreServices.getAllMessages(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return 'No messages yet!'.text.color(Colors.grey).makeCentered();
          } else {
            var data = snapshot.data!.docs;
            return Column(
              children: [
                Expanded(child: ListView.builder(
                  itemCount: data.length,
                    itemBuilder: (BuildContext context,int index){
                  return Card(
                    child: ListTile(
                      onTap: (){
                        Get.to(()=>ChatScreen(),
                        arguments: [data[index]['friend_name'],
                          data[index]['toId']]
                        );
                      },
                      leading: CircleAvatar(
                        child: Icon(Icons.person,color: Colors.white,),
                      ),
                      title: '${data[index]['friend_name']}'.text.fontWeight(FontWeight.bold).color(Colors.grey).make(),
                      subtitle: '${data[index]['last_msg']}'.text.fontWeight(FontWeight.bold).color(Colors.grey).make(),
                    ),
                  );
                }))
              ],
            );
          }
        },
      ),
    );
  }
}
