import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartapp/constant/firebase_const.dart';
import 'package:emartapp/service/firestore_service.dart';
import 'package:emartapp/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: 'WishList'.text.color(Colors.grey).fontWeight(FontWeight.bold).make()
      ),
      body: StreamBuilder(
        stream: FireStoreServices.getWishlists(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: loadingIndicator(),
            );
          }else if(snapshot.data!.docs.isEmpty){
            return
              'No orders yet!'.text.color(Colors.grey).makeCentered();

          }else{
            var data = snapshot.data!.docs;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context,int index){
                      return ListTile(
                        leading: Image.network('${data[index]['p_imgs'][0]}',
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                        title:
                        '${data[index]['p_name']}'.text.size(16).make(),
                        subtitle: '${data[index]['p_price']}'.text.make(),
                        trailing: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ).onTap(() {

                          fireStore.collection(productsCollection).doc(data[index].id).set(
                              {
                                'p_whislist':FieldValue.arrayRemove([currentUser!.uid])
                              },SetOptions(merge: true));
                        //  FireStoreServices.deleteDocument(data[index].id);
                        }),
                      );
                    },

                  ),
                ),
              ],
            );
          }

        },
      ),
    );
  }
}
