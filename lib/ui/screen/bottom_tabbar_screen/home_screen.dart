import 'package:emartapp/constant/color.dart';
import 'package:emartapp/constant/list.dart';
import 'package:emartapp/constant/string.dart';
import 'package:emartapp/widget/featured_button.dart';
import 'package:emartapp/widget/home_button.dart';
import 'package:flutter/material.dart';
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
                          child: Row(
                            children: List.generate(
                                6,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/images/buylaptop.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                        10.heightBox,
                                        'Hp G3 EliteBook'
                                            .text
                                            .black
                                            .fontWeight(FontWeight.bold)
                                            .make(),
                                        10.heightBox,
                                        'Price 31000/'
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
                                        .make()),
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
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 6,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                Text("Apple iPhone 14 Pro Max").box.alignCenterLeft.white.make(),
                                10.heightBox,
                                Row(
                                  children: [
                                    Text('Price'),
                                    5.widthBox,
                                    Text('67599/',style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ).box.white.make();
                          }),
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
