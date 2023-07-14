import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/constant/color.dart';
import 'package:emartapp/constant/list.dart';
import 'package:emartapp/constant/string.dart';
import 'package:emartapp/service/firestore_service.dart';
import 'package:emartapp/ui/screen/bottom_tabbar_screen/item_detail.dart';
import 'package:emartapp/widget/featured_button.dart';
import 'package:emartapp/widget/home_button.dart';
import 'package:emartapp/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                hintText: searchanything,
                hintStyle: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  VxSwiper.builder(
                    autoPlay: true,
                    itemCount: sliderList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: sliderList[index],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      2,
                      (index) => homeButton(
                        onPress: () {},
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width / 2.5,
                        icon: index == 0
                            ? Image.asset(
                                'assets/images/todayDeal.jpg',
                                width: 25,
                              )
                            : Image.asset(
                                'assets/images/flashSale.png',
                                width: 25,
                              ),
                        title: index == 0 ? todaydeal : flashSale,
                      ),
                    ),
                  ),
                  VxSwiper.builder(
                    itemCount: anotherSlider.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: anotherSlider[index],
                      );
                    },
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      3,
                      (index) => homeButton(
                        onPress: () {},
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width / 3.5,
                        icon: index == 0
                            ? Image.asset(
                                'assets/images/topCategories.png',
                                width: 25,
                              )
                            : index == 1
                                ? Image.asset(
                                    'assets/images/brand.png',
                                    width: 25,
                                  )
                                : Image.asset(
                                    'assets/images/bestSeller.jpg',
                                    width: 25,
                                  ),
                        title: index == 0 ? topCategories : index == 1 ? brand : topSellers ,
                      ),
                    ),
                  ),
                  10.heightBox,
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        featureCategories,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),),
                 10.heightBox,
                  Container(alignment: Alignment.centerLeft,
                    color: Colors.white,
                    child:  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            3,
                                (index) => homeButton(
                              onPress: () {},
                              height: MediaQuery.of(context).size.height * 0.10,
                              width: MediaQuery.of(context).size.width / 2.2,
                              icon: index == 0
                                  ? Image.asset(
                                'assets/images/womenclothes.jpg',
                                width: 30,
                              )
                                  : index == 1
                                  ? Image.asset(
                                'assets/images/kidsclothe.jpg',
                                width: 30,
                              )
                                  : Image.asset(
                                'assets/images/boyglass1.jpg',
                                width: 30,
                              ),
                              title: index == 0 ? womendress : index == 1 ? kidsclothes : boysglasses ,
                            ),
                          ),
                        )

                     ] ),
                    ),
                  ),
                  Container(alignment: Alignment.centerLeft,
                    color: Colors.white,
                    child:  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                          children: [Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              3,
                                  (index) => homeButton(
                                onPress: () {},
                                height: MediaQuery.of(context).size.height * 0.10,
                                width: MediaQuery.of(context).size.width / 2.2,
                                icon: index == 0
                                    ? Image.asset(
                                  'assets/images/buyphone.jpg',
                                  width: 30,
                                )
                                    : index == 1
                                    ? Image.asset(
                                  'assets/images/shoes.jpg',
                                  width: 30,
                                )
                                    : Image.asset(
                                  'assets/images/shirts.jpg',
                                  width: 30,
                                ),
                                title: index == 0 ? mobile: index == 1 ? shoes: shirts ,
                              ),
                            ),
                          )

                          ] ),
                    ),
                  ),
                  20.heightBox,
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.cyan),
                    child: Column(
                      //  mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        featureproduct.text.white
                            .fontWeight(FontWeight.bold)
                            .size(18)
                            .make(),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder(
                          future: FireStoreServices.getFeaturedProducts(),
                            builder: (context,AsyncSnapshot<QuerySnapshot>snapshot) {
                           if(!snapshot.hasData){
                           return Center(
                             child: loadingIndicator(),
                           );

                           }else if(snapshot.data!.docs.isEmpty){

                             return 'No featured product'.text.makeCentered();
                           }else {
                             var featuredData = snapshot.data!.docs;
                             return Row(
                               children: List.generate(
                                   featuredData.length,
                                       (index) =>
                                       Column(
                                         crossAxisAlignment:
                                         CrossAxisAlignment.start,
                                         children: [
                                           Image.network(
                                             featuredData[index]['p_imgs'][1],
                                             //'assets/images/buylaptop.jpg',
                                             fit: BoxFit.cover,
                                           ),
                                           10.heightBox,
                                           featuredData[index]['p_name'].toString()
                                               .text
                                               .black
                                               .fontWeight(FontWeight.bold)
                                               .make(),
                                           10.heightBox,
                                           '${featuredData[index]['p_price']}'.numCurrency
                                               .text
                                               .fontWeight(FontWeight.bold)
                                               .red500
                                               .make(),
                                         ],
                                       )
                                           .box
                                           .white
                                           .roundedSM
                                           .padding(const EdgeInsets.all(8))
                                           .margin(
                                           EdgeInsets.symmetric(horizontal: 4))
                                           .make().onTap(() { 
                                             Get.to(()=>ItemDetail(
                                                title: '${featuredData[index]['p_name']}',
                                               user: featuredData[index],
                                             ));
                                       })
                               )
                               ,
                             );
                           }
                            }
                          ),
                        )
                      ],
                    ),
                  ),
                  //
                  VxSwiper.builder(
                    itemCount: anotherSlider.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: anotherSlider[index],
                      );
                    },
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                  ),
                  20.heightBox,
                  Container(alignment: Alignment.centerLeft,
                      child: 'All Products'.text.bold.make()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(color: Colors.grey,
                      child: StreamBuilder(
                        stream: FireStoreServices.allproducts(),
                        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                        if(!snapshot.hasData){
                          return loadingIndicator();
                        }else{
                          var allproduct = snapshot.data!.docs;
                        return  GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: allproduct.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  mainAxisExtent: 300),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Image.network(
                                      allproduct[index]['p_imgs'][0],
                                      //'assets/images/applephone.jpg',
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.fill,
                                    ),
                                    '${allproduct[index]['p_name']}'.text.make(),
                                    10.heightBox,
                                    Row(
                                      children: [
                                        Text('Price'),
                                        5.widthBox,
                                        //Text('67599/',style: TextStyle(fontWeight: FontWeight.bold),),
                                        '${allproduct[index]['p_price']}'.text.make()
                                      ],
                                    )
                                  ],
                                ).box.white.make().onTap(() { 
                                  Get.to(()=>ItemDetail(title: '${allproduct[index]['p_name']}',user:allproduct[index],));
                                });
                              });
                        }
                        }
                      ),
                      // child: GridView.builder(
                      //     physics: NeverScrollableScrollPhysics(),
                      //     shrinkWrap: true,
                      //     itemCount: 6,
                      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //         crossAxisCount: 2,
                      //         mainAxisSpacing: 8,
                      //         crossAxisSpacing: 8,
                      //         mainAxisExtent: 300),
                      //     itemBuilder: (context, index) {
                      //       return Column(
                      //         children: [
                      //           Image.asset(
                      //             'assets/images/applephone.jpg',
                      //             width: 200,
                      //             height: 200,
                      //             fit: BoxFit.fill,
                      //           ),
                      //           Text("Apple iPhone 14 Pro Max").box.alignCenterLeft.white.make(),
                      //           10.heightBox,
                      //           Row(
                      //             children: [
                      //               Text('Price'),
                      //               5.widthBox,
                      //               Text('67599/',style: TextStyle(fontWeight: FontWeight.bold),),
                      //             ],
                      //           )
                      //         ],
                      //       ).box.white.make();
                      //     }),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
