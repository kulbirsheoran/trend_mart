import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/constant/list.dart';
import 'package:emartapp/controller/producct_controller.dart';
import 'package:emartapp/service/firestore_service.dart';
import 'package:emartapp/ui/screen/bottom_tabbar_screen/item_detail.dart';
import 'package:emartapp/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryDetail extends StatelessWidget {
  final String? title;

  const CategoryDetail({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
  //  final controller = Get.find<ProductController>();
    controller.getSubCategories(title);
    return Scaffold(
      appBar: AppBar(title: title!.text.fontWeight(FontWeight.bold).make()),
      body: FutureBuilder<QuerySnapshot<Map<String,dynamic>>>(
       // stream: FireStoreServices.getProducts(title),
        future: FireStoreServices.getProducts(title),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child:  loadingIndicator(),
            );
          }else if(snapshot.hasError){
            return Center(
              child:  'error loading product'.text.color(Vx.gray300).make(),
            );

          }else if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
            return const Center(
              child: Text('no product found'),
            );
          }
          else{
            var products = snapshot.data!.docs;
            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
              controller.subcategory.length,
             //         4,
                          (index) =>
               //           'djdjj'
                         '${controller.subcategory[index]}'
                              .text
                              .size(12)
                              .makeCentered()
                              .box
                              .rounded
                              .white
                              .size(150, 60)
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .make(),
                    ),
                  ),
                ),
                10.heightBox,
                Expanded(
                  child: SingleChildScrollView(
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount:products.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 250,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 4),
                        itemBuilder: (context, index) {
                          var product = products[index];
                          return Card(
                            child: Column(
                              children: [
                                Image.network(
                                  products[index]['p_imgs'][0],
                                 //categoryList[index],
                                 fit: BoxFit.fill,width: 200,height: 200,
                                  ),
                                 
                                Text(style: TextStyle(fontWeight: FontWeight.bold),
                                 '${products[index]['p_name']}'
                                ),
                                5.heightBox,

                                Text(
                                  '${products[index]['p_price']}'.numCurrency,style: TextStyle(color: Colors.red),)
                              ],
                            ),
                          ).onTap(() {
                            Get.to(()=>ItemDetail(title:'${products[index]['p_name']}',user: products[index]));
                          });
                        }),
                  ),
                )
              ],
            );
          }
        },
      )
    );
  }
}
