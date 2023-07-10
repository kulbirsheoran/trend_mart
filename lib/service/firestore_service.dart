import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/constant/firebase_const.dart';

// class FireStoreServices{
//   static getUser(uid){
//     return fireStore.collection(userCollection).doc(uid).snapshots();
//   }
// }
class FireStoreServices{
  //get user data
  static getUser(uid){
    return FirebaseFirestore.instance.collection(userCollection).doc(auth.currentUser!.uid).snapshots();
  }
  static Future<QuerySnapshot<Map<String,dynamic>>> getProducts(category){
    return FirebaseFirestore.instance.collection(productsCollection).where('p_category',isEqualTo: category).get();
  }
}