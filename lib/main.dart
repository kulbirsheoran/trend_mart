import 'package:emartapp/constant/color.dart';
import 'package:emartapp/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       // scaffoldBackgroundColor:redColor,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
    // fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}


