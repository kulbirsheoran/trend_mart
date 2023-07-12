import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/constant/color.dart';
import 'package:emartapp/constant/firebase_const.dart';
import 'package:emartapp/controller/cart_controller.dart';
import 'package:emartapp/service/firestore_service.dart';
import 'package:emartapp/ui/screen/bottom_tabbar_screen/shopping_screen.dart';
import 'package:emartapp/widget/button.dart';
import 'package:emartapp/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar:  SizedBox(
        height: 60,
        child: Button(
          Color: Colors.red,
          onPress: () {
            Get.to(()=>ShippingDetails());
          },
          textColor: Colors.white,
          title: 'Proceed to shipping',
        ),
      ),
      // backgroundColor:Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: 'Shopping cart'.text.color(Colors.grey).make(),
      ),
      body: StreamBuilder(
        stream: FireStoreServices.getCart(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          print("DineshTag cartScreen userId ${currentUser!.uid}");
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('Cart is empty'),
            );
          } else {
            var data = snapshot.data!.docs;
            controller.calculate(data);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column( 
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.network('${data[index]['img']}'),
                            title:
                                '${data[index]['titel']} (${data[index]['qty']})'.text.size(16).make(),
                            subtitle: '${data[index]['tprice']}'.text.make(),
                            trailing: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ).onTap(() {
                             FireStoreServices.deleteDocument(data[index].id);
                            }),
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      'Total price'
                          .text
                          .fontWeight(FontWeight.bold)
                          .color(Colors.grey)
                          .make(),
                      Obx(
                        () => '${controller.totalP.value}'
                            .numCurrency
                            .text
                            .fontWeight(FontWeight.bold)
                            .color(Colors.red)
                            .make(),
                      )
                    ],
                  )
                      .box
                      .padding(const EdgeInsets.all(12))
                      .width(context.screenWidth - 60)
                      .color(goldenColor)
                      .make(),
                  10.heightBox,
                  // SizedBox(
                  //   width: context.screenWidth - 60,
                  //   child: Button(
                  //     Color: Colors.red,
                  //     onPress: () {},
                  //     textColor: Colors.white,
                  //     title: 'Proceed to shipping',
                  //   ),
                  // )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
