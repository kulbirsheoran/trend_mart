import 'package:emartapp/constant/string.dart';
import 'package:emartapp/controller/home_controller.dart';
import 'package:emartapp/ui/screen/bottom_tabbar_screen/cart_screen.dart';
import 'package:emartapp/ui/screen/bottom_tabbar_screen/catergory_screen.dart';
import 'package:emartapp/ui/screen/bottom_tabbar_screen/home_screen.dart';
import 'package:emartapp/ui/screen/bottom_tabbar_screen/profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    final List<BottomNavigationBarItem> navbarItem = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: home),
      const BottomNavigationBarItem(
          icon: Icon(Icons.category), label: categories),
      const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart), label: cart),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: account),
    ];
    var navBody =[
   HomeScreen(),
    CategoryScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(()=> Expanded(child: navBody.elementAt(controller.currentNavIndex.value,))),
        ],
      ),
      bottomNavigationBar: Obx(()=>
         BottomNavigationBar(
           currentIndex: controller.currentNavIndex.value,
            items: navbarItem,
           onTap: (value){
             controller.currentNavIndex.value = value;

           },
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold ),

        ),
      ),
    );
  }
}
