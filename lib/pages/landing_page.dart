import 'package:flutter/material.dart';
import 'package:my_contact/pages/login_page.dart';
import 'package:my_contact/pages/register_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 149, 83, 241),
        ),
        padding: EdgeInsets.all(25.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Padding(padding: EdgeInsets.only(top: 5, bottom: 50)),
              Image.asset(
                'assets/images/logosmall.png',
                fit: BoxFit.cover,
              ),
              Padding(padding: EdgeInsets.only(top: 60,bottom: 80)),
              const Text(
                'Welcome To \n MyContact! \n ...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PromptSemibold',
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              const Text(
                'Simple,Secure and Easy To Use\nFor Mantain Your Personal Contact',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PromptRegular',
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 68)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 0, right: 0, top: 70),
                          padding: EdgeInsets.only(left: 20, right: 20),
                          height: 54,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                color: Color.fromARGB(255, 149, 83, 241),
                                fontSize: 18,
                                fontFamily: 'PromptMedium'),
                          ),
                        ),
                      ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterPage()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 0, right: 0, top: 10),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  color: Color(0xFFF0F0),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //       offset: Offset(0, 10),
                  //       blurRadius: 50,
                  //       color: Color(0xffEEEEEE)),
                  // ],
                ),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'PromptMedium'),
                ),
              ),
            ),
            ]
            ),
      ),
    );
  }
}
