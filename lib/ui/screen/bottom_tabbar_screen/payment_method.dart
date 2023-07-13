import 'package:emartapp/constant/color.dart';
import 'package:emartapp/constant/list.dart';
import 'package:emartapp/controller/cart_controller.dart';
import 'package:emartapp/ui/screen/home.dart';
import 'package:emartapp/widget/button.dart';
import 'package:emartapp/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Obx(()=>
       Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: SizedBox(
          height: 60,
          child: controller.placingOrder.value? Center(
            child: loadingIndicator(),
          ): Button(
            onPress: () async {
              controller.placeMyOrder(
                  orderPaymentMethod:
                      paymentMethods[controller.paymentIndex.value],
                  totalAmount: controller.totalP.value);
              await controller.clearCart();
              VxToast.show(context, msg: 'Order placed successfully');
              Get.offAll(const Home());
            },
            Color: Colors.red,
            textColor: Colors.white,
            title: 'Place my order',
          ),
        ),
        appBar: AppBar(
            title: 'Choose Payment Method'
                .text
                .fontWeight(FontWeight.bold)
                .color(Colors.grey)
                .make()),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Obx(
            () => Column(
              children: List.generate(paymentMethodImg.length, (index) {
                return GestureDetector(
                  onTap: () {
                    controller.changePaymentIndex(index);
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: controller.paymentIndex.value == index
                                ? redColor
                                : Colors.transparent,
                            width: 2)),
                    margin: EdgeInsets.only(bottom: 8),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset(
                          paymentMethodImg[index],
                          width: double.infinity,
                          height: 120,
                          colorBlendMode: controller.paymentIndex.value == index
                              ? BlendMode.darken
                              : BlendMode.color,
                          color: controller.paymentIndex.value == index
                              ? Colors.black.withOpacity(0.4)
                              : Colors.transparent,
                          fit: BoxFit.cover,
                        ),
                        controller.paymentIndex.value == index
                            ? Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                    activeColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)),
                                    value: true,
                                    onChanged: (value) {}),
                              )
                            : Container(),
                        Positioned(
                            bottom: 3,
                            right: 10,
                            child: paymentMethods[index]
                                .text
                                .black
                                .fontWeight(FontWeight.bold)
                                .make())
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
