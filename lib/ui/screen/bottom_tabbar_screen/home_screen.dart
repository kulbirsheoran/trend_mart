import 'package:emartapp/constant/list.dart';
import 'package:emartapp/constant/string.dart';
import 'package:emartapp/widget/home_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.center ,
              height: 60,
              color: Colors.grey,
              child: TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor:Colors.white,
                  hintText: searchanything,
                  hintStyle: TextStyle(
                    color:Colors.grey
                  )

                ),
              ),
            ),
            //
            VxSwiper.builder(itemCount: sliderList.length , itemBuilder: (context,index){
              return Container(decoration: BoxDecoration(

              ),
                child: sliderList[index],
              );
            }),
           // box.rounded.make()
            Row(
              children:
                List.generate(2, (index) => HomeButton(
                   // height:context.screenHeight*0.2,
               // Size.fromWidth(scre)
                )),

            )
          ],
        ),
      ),
    );
  }
}
