import 'package:emartapp/constant/color.dart';
import 'package:emartapp/constant/list.dart';
import 'package:emartapp/constant/string.dart';
import 'package:emartapp/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetail extends StatelessWidget {
  final String? title;

  const ItemDetail({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: title!.text.black.make(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined),
              color: Colors.black,
            ),
          ],
        ),
 body: Column(
   children: [
     Expanded(
     child: Padding(
       padding: EdgeInsets.all(8.0),
       child: SingleChildScrollView(
         child: Column(crossAxisAlignment:CrossAxisAlignment.start ,
           children: [
             VxSwiper.builder(
                 autoPlay: true,
                 height: 202,
                 itemCount: 3,
                 itemBuilder: (context, index) {
                   return Image.asset(
                     'assets/images/boyglass1.jpg',
                     width: double.infinity,
                     fit: BoxFit.cover,
                   );
                 }),
             //title and desc
             10.heightBox,
             title!.text.size(16).black.make(),
             15.heightBox,
             VxRating(
               onRatingUpdate: (value) {},
               normalColor: Vx.white,
               selectionColor: Colors.yellow,
               count: 5,
               size: 25,
               stepInt: true,
             ),
             10.heightBox,
             'Price 5000'.text.red500.fontWeight(FontWeight.bold).make(),
             10.heightBox,
             Row(
               children: [
                 Expanded(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       'Seller'.text.white.make(),
                       5.heightBox,
                       'In House Brands'.text.make()
                     ],
                   ),
                 ),
                  CircleAvatar(
                   backgroundColor: Colors.white,
                   child: Icon(
                     Icons.message_rounded,
                     color: Colors.grey,
                   ),
                 )
               ],
             ).box.gray400.p8.make(),
             //color Section
             20.heightBox,
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: 'Color:'.text.gray400.make(),
                                ),
                                Row(
                                    children: List.generate(

                                      3,
                                          (index) => VxBox()
                                          .size(40, 40)
                                          .roundedFull
                                          .color(Vx.randomPrimaryColor)
                                          .margin(EdgeInsets.symmetric(horizontal: 4))
                                          .make(),
                                    ))
                              ]
                            ).box.padding(EdgeInsets.symmetric(horizontal: 8)).make(),
                            Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: 'Color:'.text.gray400.make(),
                                  ),
                                  Row(
                                      children: [
                                                           IconButton(onPressed: (){}, icon: Icon(Icons.remove), ),
                                                            '0'.text.size(16).green700.make(),
                                                            IconButton(onPressed: (){}, icon: Icon(Icons.add), ),
                                                            10.widthBox,
                                                            '(0 availabel)'.text.make(),
                                                          ],
                                     )
                                ]
                            ).box.padding(EdgeInsets.symmetric(horizontal: 8)).make(),
                            Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: 'Total:'.text.gray400.make(),
                                  ),
                                  Row(children: [
                                    '\$0.0'.text.color(Colors.red).make()
                                   ]
                                  ).box.padding(EdgeInsets.symmetric(horizontal: 8)).make(),

                                ]
                            ).box.white.shadowSm.make(),
                            10.heightBox,
                            Row(
                              children: [
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        'Description'.text.align(TextAlign.start).make(),
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                            10.heightBox,
                            Row(
                              children: [
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    'this is description'.text.fontWeight(FontWeight.normal).align(TextAlign.start).make(),

                                  ],
                                ),

                              ],
                            ),

                          ],
                        ),
             10.heightBox,
             ListView.builder(
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
               itemCount: itemDetails.length,
               itemBuilder: (context, index) {
                 return ListTile(
                   title: itemDetails[index].text.fontWeight(FontWeight.bold).make(),
                   trailing: Icon(Icons.forward),
                 );
               },
             ),
             10.heightBox,
             'Products you may also like'.text.make(),
              GridView.builder(
                 physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 itemCount: 6,
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     mainAxisSpacing: 8,
                     crossAxisSpacing: 8,
                     mainAxisExtent: 300),
                 itemBuilder: (context, index) {
                   return Column(
                     children: [
                       Image.asset(
                         'assets/images/applephone.jpg',
                         width: 200,
                         height: 200,
                         fit: BoxFit.fill,
                       ),
                       const Text("Apple iPhone 14 Pro Max").box.alignCenterLeft.white.make(),
                       10.heightBox,
                       Row(
                         children: [
                           Text('Price'),
                           5.widthBox,
                           Text('67599/',style: TextStyle(fontWeight: FontWeight.bold),),
                         ],
                       )
                     ],
                   ).box.white.make();
                 }),
             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

               children: [
                 ElevatedButton(
                     onPressed: (){}, child: const Text(signup)),
                 ElevatedButton(onPressed: (){}, child: const Text('Add to cart')
                 )],
             )
           ],
         ),
       ),
     ),
     ),
     SizedBox(
       width: double.infinity,
       child: Button(
           textColor: Colors.white, title: addcart, Color: redColor),
     ).box.red500.make()
    ] ),

 );}}

