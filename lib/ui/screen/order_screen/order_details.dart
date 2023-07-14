import 'package:emartapp/constant/color.dart';
import 'package:emartapp/ui/screen/order_screen/order_place_details.dart';
import 'package:emartapp/ui/screen/order_screen/order_status.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetails extends StatelessWidget {
  final dynamic data;

  const OrderDetails({Key? key, required this.data}) : super(key: key);

  get index => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Order Details'.text.fontWeight(FontWeight.bold).make(),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              orderStatus(
                  color: redColor,
                  icon: Icons.done,
                  title: "placed",
                  showDone: data?['order_placed'] ?? true),
              orderStatus(
                  color: Colors.blue,
                  icon: Icons.thumb_up_alt_rounded,
                  title: "Confirmed",
                  showDone: data?['order_confirmed'] ?? true),
              orderStatus(
                  color: Colors.yellow,
                  icon: Icons.car_crash_sharp,
                  title: "On Delivery",
                  showDone: data?['order_on_delivery'] ?? true),
              orderStatus(
                  color: Colors.purple,
                  icon: Icons.done_all_rounded,
                  title: "Delivered",
                  showDone: data?['order_delivered'] ?? true),
              Divider(),
              10.heightBox,
              Column(
                children: [
                  orderPlaceDetails(
                    d1: data['order_code'],
                    d2: data['shipping_method'],
                    title1: 'Order Code',
                    title2: 'Shipping Method',
                  ),
                  orderPlaceDetails(
                    // d1:data['order_date'].toDate(),
                    d1: intl.DateFormat()
                        .add_yMd()
                        .format((data['order_date'].toDate())),
                    d2: data['payment_method'],
                    title1: 'Order Date',
                    title2: 'Payment Method',
                  ),
                  orderPlaceDetails(
                    d1: 'Unpaid',
                    d2: 'Order Placed',
                    title1: 'Payment Status',
                    title2: 'Delivery Status',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            'Shipping Address'
                                .text
                                .fontWeight(FontWeight.bold)
                                .make(),
                            '${data['order_by_name']}'
                                .text
                                .color(Colors.red)
                                .make(),
                            '${data['order_by_email']}'
                                .text
                                .color(Colors.red)
                                .make(),
                            '${data['order_by_address']}'
                                .text
                                .color(Colors.red)
                                .make(),
                            '${data['order_by_city']}'
                                .text
                                .color(Colors.red)
                                .make(),
                            '${data['order_by_state']}'
                                .text
                                .color(Colors.red)
                                .make(),
                            '${data['order_by_phone']}'
                                .text
                                .color(Colors.red)
                                .make(),
                            '${data['order_by_postalCode']}'
                                .text
                                .color(Colors.red)
                                .make(),
                          ],
                        ),
                      ),

                      //Divider(thickness: 3,color: Colors.black87),
                      SizedBox(
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            'Total Amount'
                                .text
                                .color(Colors.black)
                                .fontWeight(FontWeight.bold)
                                .make(),
                            '${data['total_amount']}'
                                .text
                                .color(Colors.red)
                                .make(),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ).box.outerShadowSm.white.make().card.make(),
              Divider(),
              10.heightBox,
              'Ordered Product'
                  .text
                  .fontWeight(FontWeight.bold)
                  .size(16)
                  .make().card.white.make(),
              10.heightBox,
             ListView(
               shrinkWrap: true,
               children: List.generate(data['orders'].length, (index){
                 return Column(crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     orderPlaceDetails(
                     title1: data['orders'][index]['titel'],
                     title2: data['orders'][index]['tprice'],
                     d1: '${data['orders'][index]['qty']}x',
                     d2: 'Refundable',
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                       child: Container(
                         width: 30,
                         height: 10,
                         color: Color(data['orders'][index]['color']),
                       ),
                     ),
                     Divider()
                   ],
                 );
               }).toList(),
             ).box.outerShadowSm.white.margin(EdgeInsets.only(bottom: 4)).make(),
              10.heightBox,
            ],
          ),
        ],
      ),

    );
  }
}
