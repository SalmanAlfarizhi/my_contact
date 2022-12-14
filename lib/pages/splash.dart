import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_contact/pages/landing_page.dart';
import 'package:my_contact/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
    void initState(){
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return new Timer(duration, LoginRoute);
  }

  LoginRoute(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => LandingPage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
         color: Color.fromARGB(255, 149, 83, 241),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo_app.png',height: 178,width: 148,),const SizedBox(),
        ],
      ),
      ),
    );
  }
}