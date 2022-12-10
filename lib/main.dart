import 'package:flutter/material.dart';
import 'package:my_contact/pages/add_page.dart';
import 'package:my_contact/pages/home_page.dart';
import 'package:my_contact/pages/landing_page.dart';
import 'package:my_contact/pages/splash.dart';

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
      // theme: ThemeData(
      //   primarySwatch: Colors.white,
      // ),
      // home: LandingPage(),
      home: SplashPage(),
      // home: Home(),
      // home: HomePage(),
      // home: AddPage(),
    );
  }
}
