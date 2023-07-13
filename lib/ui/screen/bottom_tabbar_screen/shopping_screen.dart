import 'package:emartapp/controller/cart_controller.dart';
import 'package:emartapp/ui/screen/bottom_tabbar_screen/payment_method.dart';
import 'package:emartapp/widget/button.dart';
import 'package:emartapp/widget/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:'Shippiing Info'.text.fontWeight(FontWeight.bold).color(Colors.grey).make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Button(
          onPress: (){
            if(controller.addressController.text.length > 10){
              Get.to(()=>PaymentMethods());
            }else {
              VxToast.show(context, msg: 'Please fill the form');
            }},
          Color: Colors.red,
          textColor: Colors.white,
          title: 'Continue',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Column(
              children: [
                customTextField(hint: 'Address',isPass: false,title: 'Address',controller: controller.addressController),
                customTextField(hint: 'City',isPass: false,title: 'City',controller: controller.cityController),
                customTextField(hint: 'State',isPass: false,title: 'State',controller: controller.stateController),
                customTextField(hint: 'Postal Code',isPass: false,title: 'Postal Code',controller: controller.postalcodeController),
                customTextField(hint: 'Phone',isPass: false,title: 'Phone',controller: controller.phoneController),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
