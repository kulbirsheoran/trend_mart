import 'package:emartapp/constant/color.dart';
import 'package:emartapp/constant/list.dart';
import 'package:emartapp/constant/string.dart';
import 'package:emartapp/controller/producct_controller.dart';
import 'package:emartapp/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetail extends StatelessWidget {
  final String? title;
  final dynamic user;

  const ItemDetail({Key? key, required this.title, this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(Colors.red);
    // print(Colors.blueGrey);
    // print(Colors.purple);
    var controller = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: title!.text.black.make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      height: 202,
                      itemCount: user['p_imgs'].length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          user['p_imgs'][index],
                          // 'assets/images/boyglass1.jpg',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }),
                  //title and desc
                  10.heightBox,
                  title!.text.size(16).black.make(),
                  15.heightBox,
                  VxRating(
                    // isSelectable: false,
                    value: double.parse(user['p_rating']),
                    onRatingUpdate: (value) {},
                    normalColor: Vx.white,
                    selectionColor: Colors.yellow,
                    count: 5,
                    size: 25,
                    maxRating: 5,
                    //  stepInt: true,
                  ),
                  10.heightBox,
                  '${user['p_price']}'
                      .numCurrency
                      .text
                      .red500
                      .fontWeight(FontWeight.bold)
                      .make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            'Seller'.text.white.make(),
                            5.heightBox,
                            '${user['p_seller']}'.text.make()
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.message_rounded,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ).box.gray400.p8.make(),
                  //color Section
                  20.heightBox,
                  Obx(()=>
                     Column(
                       children: [
                         Row(children: [
                          SizedBox(
                            width: 100,
                            child: 'Color:'.text.gray400.make(),
                          ),
                          Row(
                              children: List.generate(
                            user['p_colors'].length,
                            // 3,
                            (index) => Stack(
                              alignment: Alignment.center,
                              children: [
                                VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Color(user['p_colors'][index])
                                        .withOpacity(1.0))
                                    .margin(EdgeInsets.symmetric(horizontal: 4))
                                    .make().onTap(() {
                                     // controller.changColorIndex(index);
                                  controller.colorIndex.value = index;
                                }),
                                Visibility(
                                   visible:  index == controller.colorIndex.value,
                                   child:  const Icon(Icons.done,color: Colors.white,))
                              ],
                            ),
                          ))
                    ])
                            .box
                            .padding(EdgeInsets.symmetric(horizontal: 8))
                            .make(),
                       ],
                     ),
                  ),
                  Row(children: [
                    SizedBox(
                      width: 100,
                      child: 'Quantity:'.text.gray400.make(),
                    ),
                    Obx(()=>
                      Row(
                        children: [

                          IconButton(
                            onPressed: () {
                              controller.decreaseQuantity();
                              controller.calculateTotalPrice(int.parse(user['p_price']));
                            },
                            icon: Icon(Icons.remove),
                          ),
                          '${controller.quantity.value}'.text.size(16).green700.make(),
                          IconButton(
                            onPressed: () {
                              controller.increaseQuantity(int.parse(user['p_quantity']));
                              controller.calculateTotalPrice(int.parse(user['p_price']));
                            },
                            icon: Icon(Icons.add),
                          ),
                          10.widthBox,
                          '(${user['p_quantity']} available)'.text.make(),
                        ],
                      ),
                    )
                  ])
                      .box
                      .padding(const EdgeInsets.symmetric(horizontal: 8))
                      .make(),
                  Row(children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      child: 'total'.text.red500.make(),
                    ),

                    '${controller.totalPrice.value}'.numCurrency .text.gray400.make()
                        .box
                        .padding(EdgeInsets.symmetric(horizontal: 8))
                        .make(),
                  ]).box.white.shadowSm.make(),
                  10.heightBox,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: ['Description'
                                  .text
                                  .align(TextAlign.start)
                                  .fontWeight(FontWeight.bold)
                                  .make(),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          '${user['p_description']}'
                              .text
                              .size(16)
                              .align(TextAlign.start)
                              .make(),
                        ],
                      ),
                    ],
                  ),
                  10.heightBox,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: itemDetails.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: itemDetails[index]
                            .text
                            .fontWeight(FontWeight.bold)
                            .make(),
                        trailing: Icon(Icons.forward),
                      );
                    },
                  ),
                  10.heightBox,
                  'Products you may also like'.text.make(),
                  GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 300),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Image.asset(
                              'assets/images/applephone.jpg',
                              width: 200,
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                            const Text("Apple iPhone 14 Pro Max")
                                .box
                                .alignCenterLeft
                                .white
                                .make(),
                            10.heightBox,
                            Row(
                              children: [
                                Text('Price'),
                                5.widthBox,
                                Text(
                                  '67599/',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ).box.white.make();
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text(signup)),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Add to cart'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child:
              Button(textColor: Colors.white, title: addcart, Color: redColor),
        ).box.red500.make()
      ]),
    );
  }
}
