import 'package:emartapp/model/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
 var subcategory =[];

 var quantity = 0.obs;
 var colorIndex = 0.obs;
 var totalPrice = 0.obs;
  getSubCategories(title)async{
    subcategory.clear();
    var user  = await rootBundle.loadString("lib/service/category_model.json");
    var decoded =  categoryModelFromJson(user);
    var s = decoded.categories.where((element) => element.name == title).toList();

    for(var e in s[0].subcategory){
      subcategory.add(e);
    }
  }
   changColorIndex(index){
    colorIndex = index;
   }
   increaseQuantity(totalQuantity){
    if(quantity.value<totalQuantity){
    quantity.value++;
   }}
   decreaseQuantity(){
    if(quantity.value>0){
    quantity.value--;

   }}
  calculateTotalPrice(price){
   totalPrice.value =  price*quantity.value;

  }
}