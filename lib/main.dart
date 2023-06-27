import 'package:emartapp/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.red,
        appBarTheme: AppBarTheme(backgroundColor: Colors.red),
    // fontFamily: regular,
      ),
      home: SplashScreen(),
    );
  }
}


