
//import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/constant/firebase_const.dart';
import 'package:emartapp/constant/string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
 //get firestore => null;

  Future<UserCredential?> loginMethod({email,password,context})async{
    UserCredential? userCredential;
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());

    }
    return userCredential;
  }
  Future<UserCredential?> signUpMethod({email,password,context})async{
    UserCredential? userCredential;
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());

    }
    return userCredential;
  }
  storeUserData(name,password,email,)async{
    DocumentReference store = await FirebaseFirestore.instance.collection(userCollection).doc(currentUser!.uid);
    store.set({'name':name,'password':password,'email':email,'imageUrl':''});
  }
  signOutMethod(context)async{
    try{
      await auth.signOut();
    }catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }
}