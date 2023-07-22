import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/constant/firebase_const.dart';
import 'package:emartapp/controller/producct_controller.dart';
import 'package:emartapp/service/firestore_service.dart';
import 'package:emartapp/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'item_detail.dart';

class SearchScreen extends StatelessWidget {
  final String? title;

  SearchScreen({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    return Scaffold(
        appBar: AppBar(
          title: title!.text.make(),
        ),
        body: FutureBuilder(
          future: FireStoreServices.searchProducts(title),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return 'No products found'.text.makeCentered();
            } else {
              var data = snapshot.data!.docs;
              var filtered = data
                  .where(
                    (element) => element['p_name']
                        .toString()
                        .toLowerCase()
                        .contains(title!.toLowerCase()),
                  )
                  .toList();
              // print(data[0]['p_name']);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      mainAxisExtent: 300),
                  children: filtered
                      .mapIndexed((currentValue, index) => Column(
                            children: [
                              Column(
                                children: [
                                  Image.network(
                                    filtered[index]['p_imgs'][0],
                                    //'assets/images/applephone.jpg',
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.fill,
                                  ),
                                  '${filtered[index]['p_name']}'.text.make(),
                                  10.heightBox,
                                  Row(
                                    children: [
                                      Text('Price'),
                                      5.widthBox,
                                      //Text('67599/',style: TextStyle(fontWeight: FontWeight.bold),),
                                      '${filtered[index]['p_price']}'.text.make()
                                    ],
                                  )
                                ],
                              )
                            ],
                          ).box.white.make().onTap(() {
                            Get.to(() => ItemDetail(
                                  title: '${filtered[index]['p_name']}',
                                  user: filtered[index],
                                ));
                          }))
                      .toList(),
                ),
              );
            }
          },
        ));
  }
}
