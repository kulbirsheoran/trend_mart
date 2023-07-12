import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/constant/firebase_const.dart';

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

  static deleteDocument(docId){
    return fireStore.collection(cartCollection).doc(docId).delete();
  }
  static getChatMessages(docId){
    return fireStore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messageCollection)
        .orderBy('created_on',descending:  false)
        .snapshots();
  }
}
