import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/constant/color.dart';
import 'package:emartapp/service/firestore_service.dart';
import 'package:emartapp/ui/screen/order_screen/order_details.dart';
import 'package:emartapp/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: 'My Orders'.text.color(Colors.grey).fontWeight(FontWeight.bold).make()
      ),
      body: StreamBuilder(
        stream: FireStoreServices.getAllOrders(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: loadingIndicator(),
            );
          }else if(snapshot.data!.docs.isEmpty){
            return
               'No orders yet!'.text.color(Colors.grey).makeCentered();

          }else{

            var data = snapshot.data!.docs;

          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context,int index){
                return ListTile(
                  leading: '${index+1}'.text.color(Colors.blueGrey).xl.make(),
                title:  data[index]['order_code'].toString().text.color(redColor).make(),
                  subtitle: data[index]['total_amount'].toString().text.color(Colors.grey).make(),
                  trailing: IconButton(onPressed: (){

                  }, icon: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,).onTap(() {
                    Get.to(() =>  OrderDetails(data: data[index].data(),));
                  }))
                );
              }
          );
            
          
          }

        },
      ),
    );
  }
}
