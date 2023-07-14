import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/constant/firebase_const.dart';
import 'package:emartapp/constant/string.dart';
import 'package:get/get.dart';

// class FireStoreServices{
//   static getUser(uid){
//     return fireStore.collection(userCollection).doc(uid).snapshots();
//   }
// }
class FireStoreServices {
  //get user data
  static getUser(uid) {
    return FirebaseFirestore.instance
        .collection(userCollection)
        .doc(auth.currentUser!.uid)
        .snapshots();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getProducts(category) {
    return FirebaseFirestore.instance
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .get();
  }

  //get cart
  static getCart(uid) {
    return fireStore
        .collection(cartCollection)
        // print("no data")
        .where('added_by', isEqualTo: uid)
        .snapshots();
    print('data come');
  }

  static deleteDocument(docId) {
    return fireStore.collection(cartCollection).doc(docId).delete();
  }

  static getChatMessages(docId) {
    return fireStore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }

  static getAllOrders() {
    return fireStore
        .collection(ordersCollection)
        .where('order_by', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  static getWishlists() {
    return fireStore
        .collection(productsCollection)
        .where('p_whislist', arrayContains: currentUser!.uid)
        .snapshots();
  }
  static getAllMessages(){
    return fireStore
        .collection(chatsCollection).where('fromId',isEqualTo:auth.currentUser!.uid).snapshots();
       // .doc(docId).snapshots();
  }
   static getCounts()async{
    var res = await Future.wait([
     fireStore.collection(cartCollection).where('added_by',isEqualTo: currentUser!.uid).get().then((value){

     return value.docs.length;
     }),
      fireStore.collection(productsCollection).where('p_whishlist',arrayContains: currentUser!.uid).get().then((value){

        return value.docs.length;
      }),
      fireStore.collection(ordersCollection).where('order-_by',isEqualTo: currentUser!.uid).get().then((value){

        return value.docs.length;
      })
    ]);
    return res;
   }
   static allproducts(){
    return fireStore.collection(productsCollection).snapshots();
   }
   //get featured products method
   static getFeaturedProducts(){
    return fireStore.collection(productsCollection).where('is_featured',isEqualTo: true).get();
   }
}
