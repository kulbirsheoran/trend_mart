import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/constant/firebase_const.dart';
import 'package:emartapp/constant/string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
class ProfileController extends GetxController{
 var profileImgPath = ''.obs;
 var profileImageLink ='';
 var isLoading = false.obs;

var nameController = TextEditingController();
//var emailController = TextEditingController();
var oldpassController = TextEditingController();
var newpassController = TextEditingController();


changeImage(context)async{
  try{
        final img = await ImagePicker().pickImage(source:ImageSource.gallery,imageQuality: 70);
        if(img == null)return;
        profileImgPath.value= img.path;
      }on PlatformException catch(e){
    VxToast.show(context, msg: (e.toString()));
  }
}
uploadProfileImage() async {
  var filename = basename(profileImgPath.value);
  var destination ='images/${currentUser!.uid}/$filename';
  Reference ref = FirebaseStorage.instance.ref().child(destination);
  await ref.putFile(File(profileImgPath.value));
  profileImageLink = await ref.getDownloadURL();
}
updateProfile({name,password,imgUrl})async{
  var store = fireStore.collection(userCollection).doc(auth.currentUser!.uid);
 await store.set({
    'name':name,
    'password':password,
    'imageUrl':imgUrl

  },SetOptions(merge: true));
 isLoading(false);
}
 changeAuthPassword({email,password,newpassword})async{
  final cred = EmailAuthProvider.credential(email: email, password: password);
  await auth.currentUser!.reauthenticateWithCredential(cred).then((value){auth.currentUser!.updatePassword(newpassword);
  }).catchError((error){
    print(error.toString());
  });

 }
}