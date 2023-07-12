// import 'package:emartapp/constant/firebase_const.dart';
// import 'package:emartapp/model/category_model.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// class ProductController extends GetxController{
//  var subcategory =[];
//
//  var quantity = 0.obs;
//  var colorIndex = 0.obs;
//  var totalPrice = 0.obs;
//   getSubCategories(title)async{
//     subcategory.clear();
//     var user  = await rootBundle.loadString("lib/service/category_model.json");
//     var decoded =  categoryModelFromJson(user);
//     var s = decoded.categories.where((element) => element.name == title).toList();
//
//     for(var e in s[0].subcategory){
//       subcategory.add(e);
//     }
//   }
//    changColorIndex(index){
//     colorIndex = index;
//    }
//    increaseQuantity(totalQuantity){
//     if(quantity.value<totalQuantity){
//     quantity.value++;
//    }}
//    decreaseQuantity(){
//     if(quantity.value>0){
//     quantity.value--;
//
//    }}
//   calculateTotalPrice(price){
//    totalPrice.value =  price*quantity.value;
//
//   }
//   addToCart({title,img,sellerName,color,qty,tprice,context})async{
// await fireStore.collection(cartCollection).doc().set({
//   'titel': title,
//   'img': img,
//   'sellername': sellerName,
//   'color': color,
//   'qty': qty,
//   'tprice': tprice,
//   'added_by':auth.currentUser!.uid
// }).catchError((error){
//   VxToast.show(context,msg:error.toString());
// });
//
//   }
//   resetValues(){
//     totalPrice.value =0;
//     quantity.value =0;
//     colorIndex.value =0;
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/constant/firebase_const.dart';
import 'package:emartapp/model/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductController extends GetxController {
  var subcategory = [];

  var quantity = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;
  var isFav = false.obs;

  getSubCategories(title) async {
    subcategory.clear();
    var user = await rootBundle.loadString("lib/service/category_model.json");
    var decoded = categoryModelFromJson(user);
    var s = decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategory) {
      subcategory.add(e);
    }
  }

  changeColorIndex(index) {
    colorIndex.value = index;
  }

  increaseQuantity(totalQuantity) {
    if (quantity.value < totalQuantity) {
      quantity.value++;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }

  addToCart({title, img, sellerName, color, qty, tprice, context}) async {
    await fireStore.collection(cartCollection).doc().set({
      'titel': title,
      'img': img,
      'sellername': sellerName,
      'color': color,
      'qty': qty,
      'tprice': tprice,
      'added_by': auth.currentUser!.uid
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValues() {
    totalPrice.value = 0;
    quantity.value = 0;
    colorIndex.value = 0;
  }
  addToWishlist(docId,context)async{
    await fireStore.collection(productsCollection).doc(docId).set({
'p_whishlist':FieldValue.arrayUnion([
  currentUser!.uid
])
    }, SetOptions(merge:true));
    isFav(true);
    VxToast.show(context, msg: 'Add to whishlist');
  }
  removeFromWishlist(docId,context)async{
    await fireStore.collection(productsCollection).doc(docId).set({
      'p_whishlist':FieldValue.arrayRemove([
        currentUser!.uid
      ])
    }, SetOptions(merge:true));

     isFav(false);
  VxToast.show(context, msg: 'Remove from whislist');
  }
  checkIfFav(data)async{
   if(data['p_whishlist'].contains(currentUser!.uid)){
     isFav(true);
   }else{
     isFav(false);
   }

  }
}
