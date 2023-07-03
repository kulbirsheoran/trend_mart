import 'package:emartapp/constant/list.dart';
import 'package:emartapp/ui/screen/bottom_tabbar_screen/item_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryDetail extends StatelessWidget {
  final String? title;

  const CategoryDetail({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title!.text.fontWeight(FontWeight.bold).make()),
      body: Container(
        child: (Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      6,
                      (index) => "women dress"
                          .text
                          .size(12)
                          .makeCentered()
                          .box
                          .rounded
                          .white
                          .size(150, 60)
                          .margin(EdgeInsets.symmetric(horizontal: 4))
                          .make()))
            ),
            Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 200,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 4),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: 150,
                            height: 120,
                            child: Image.asset(
                              categoryList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .blue300
                                .rounded
                                .clip(Clip.antiAlias)
                                .outerShadow
                                .make()
                                .onTap(() {
                              Get.to(() => ItemDetail(
                                  title: categoriesList1[index]));
                            }),
                          ),
                          SizedBox(
                            height: 40,
                            child: Text(
                              categoriesList1[index],
                            ),
                          )
                        ],
                      );
                    }))
          ],
        )),
      ),
    );
  }
}
