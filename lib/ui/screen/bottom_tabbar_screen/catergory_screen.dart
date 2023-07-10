import 'package:emartapp/constant/list.dart';
import 'package:emartapp/constant/string.dart';
import 'package:emartapp/controller/producct_controller.dart';
import 'package:emartapp/ui/screen/bottom_tabbar_screen/category_detial.dart';
import 'package:emartapp/widget/bg_widget.dart';
import 'package:emartapp/widget/category_widget.dart';
import 'package:emartapp/widget/home_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constant/color.dart';
import '../../../widget/applogo_widget.dart';

class CategoryScreen extends StatelessWidget {
   CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var controller =Get.put(ProductController());
    //final controller =Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: categories.text.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: categoryList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
             mainAxisExtent: 160
            ),
            itemBuilder: (context, index) {
              return  Column(
                children: [
                  Container(
                    width: 150,
                    height: 120,
                    child: Image.asset(
                      categoryList[index],
                      fit: BoxFit.fill,

                    ).box.white.rounded.clip(Clip.antiAlias).outerShadow.make().onTap(() {
                      controller.getSubCategories(categoryList[index]);
                      Get.to(()=>CategoryDetail(title: categoriesList1[index]));
                    }),
                  ),
                SizedBox(height: 40,
                    child: Text(categoriesList1[index],

                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
