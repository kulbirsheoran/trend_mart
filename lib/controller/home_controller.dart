import 'package:emartapp/constant/firebase_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

//
// class HomeController extends GetxController{
//   get currentNavIndex => 0.obs;
//
// }
class HomeController extends GetxController {
  @override
  void onInit() {
   getUsername();
    super.onInit();
  }
  RxInt currentNavIndex = 0.obs;

  var username = '';

  var searchController = TextEditingController();

  getUsername()async{
   var n = await fireStore.collection(userCollection).where('id',isEqualTo:currentUser!.uid ).get().then((value){
      if(value.docs.isNotEmpty){
        return value.docs.single['name'];
      }
    });
   username = n;
 //print(username);
  }

}

