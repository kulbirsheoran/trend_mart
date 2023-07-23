import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/constant/firebase_const.dart';
import 'package:emartapp/constant/list.dart';
import 'package:emartapp/controller/auth_controller.dart';
import 'package:emartapp/controller/profile_controller.dart';
import 'package:emartapp/service/firestore_service.dart';
import 'package:emartapp/ui/chat_screen/messaging_screen.dart';
import 'package:emartapp/ui/screen/bottom_tabbar_screen/profile_edit.dart';
import 'package:emartapp/ui/screen/login_screen.dart';
import 'package:emartapp/ui/screen/order_screen/order_screen.dart';
import 'package:emartapp/widget/details_card.dart';
import 'package:emartapp/widget/loading_indicator.dart';
import 'package:emartapp/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
  //  FireStoreServices.getCounts;
   // print("KulluTag userId ${auth.currentUser!.uid}");
    return Scaffold(
        backgroundColor: Vx.white,
        body: Column(
          children: [
            StreamBuilder(
              //current useer mail aa rhi h
              stream: FireStoreServices.getUser(auth.currentUser!.uid),
              builder:
                  (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasData && (snapshot.data?.exists ?? false)) {
                      DocumentSnapshot document = snapshot.data!;
                      // Access the document's data
                      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      return body(context,controller,data);

                    } else if (snapshot.hasData && !(snapshot.data?.exists??false)) {
                      return const Center(child: Text('Document does not exist'));
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
              },
            ),

          ],
        ));
  }

  SafeArea body(BuildContext context, ProfileController controller, user) {
    return
      SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              color: Colors.red,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ).onTap(() {
                  //      controller.changeImage(context);
                       controller.nameController.text = user!['name'];
                   //  controller.passController.text = user!['password'];
                        Get.to(() =>  ProfileEdit(user: user,));
                      }

                      )),

                  Row(
                    children: [
                     user['imageUrl'] == '' ?
                    Image.asset('assets/images/kidsclothe.jpg',width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()

                    : Image.network(user['imageUrl'],width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make() ,

                        Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                               '${user['name']}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                             '${user['email']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width: 25),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white)),
                          onPressed: () async {
                            await Get.put(
                                AuthController().signOutMethod(context));
                            Get.offAll(LoginScreen());
                          },
                          child: 'Log out'.text.white.make()),
                    ],
                  ),

                    FutureBuilder(
                        future: FireStoreServices.getCounts(),
                        builder: (BuildContext context,AsyncSnapshot snapshot){
                     if(!snapshot.hasData){
                       return Center(
                         child: loadingIndicator(),
                       );
                     }else{
                       var countData = snapshot.data;
                       return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          detailsCard(
                          count:countData[0].toString(),
                          title: 'your cart',
                          width: context.screenWidth / 3.4),
                          detailsCard(
                          count: countData[1].toString(),
                          title: 'your wishlist',
                          width: context.screenWidth / 3.4),
                          detailsCard(
                          count: countData[2].toString(),
                          title: 'yours orders',
                          width: context.screenWidth / 3.4),
                          ],
                          );
                     }
                    }),



                  20.heightBox,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: profileButtonList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: (){
                          switch(index){
                            case 0:Get.to(()=>const OrderScreen());
                            break;
                            case 1: Get.to(()=>const WishlistScreen());
                            break;
                            case 2: Get.to(()=>const MessagesScreen());
                            break;
                          }
                        },
                         title: profileButtonList[index]
                              .text
                              .fontWeight(FontWeight.bold)
                              .make(),
                         trailing: profileButtonIcon[index]
                      );
                    },
                  ).box.rounded.white.make(),
                ],
              ),
            ),
          ],
        ),
      );
  }
 }