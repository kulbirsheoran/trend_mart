import 'package:emartapp/constant/color.dart';
import 'package:emartapp/constant/list.dart';
import 'package:emartapp/ui/screen/bottom_tabbar_screen/profile_screen.dart';
import 'package:emartapp/widget/bg_widget.dart';
import 'package:emartapp/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AccountScreeen extends StatelessWidget {
  const AccountScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: Colors.red,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(alignment: Alignment.topRight,
                      child: Icon(Icons.edit,color: Colors.white,)),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30, // Adjust the radius as needed
                        backgroundImage:
                            AssetImage('assets/images/kidsclothe.jpg'),
                        // Replace with your image asset path
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                'kl Sheoran',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'kl@gmail.com',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white)),
                          onPressed: () {},
                          child: 'Log out'.text.white.make())
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        detailsCard(count: '00',title: 'In your cart',width: context.screenWidth/3.4),
                        detailsCard(count: '47',title: 'In your wishlist',width: context.screenWidth/3.4),
                        detailsCard(count: '238',title: 'yours orders',width: context.screenWidth/3.4),
                      ],
                    ),
                  ),
                  20.heightBox,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: profileButtonList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: profileButtonList[index].text.fontWeight(FontWeight.bold).make(),
                        trailing: profilebuttonicon[index]
                      );
                    },
                  ).box.rounded.white.make(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
