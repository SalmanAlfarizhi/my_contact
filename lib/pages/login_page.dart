import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_contact/pages/home_page.dart';
import 'package:my_contact/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  void login(String email, password) async {
  try {
      var response = await Dio().get('http://localhost:3000/users?email=' + email + '&password=' + password);
      if (response.data.length > 0) {
          final snackBar = SnackBar(
          backgroundColor: Color.fromARGB(255, 149, 83, 241),
          content: Text(
            'Login Success',
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("Login success");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Invalid email or password',
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

    } catch (e) {
     final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          e.toString(),
          style: TextStyle(
            fontFamily: 'Poppins-Regular',
            color: Colors.white,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }



  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 215,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Color.fromARGB(255, 149, 83, 241),
              ),
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Image.asset(
                          "assets/images/logoclean.png"
                        ),
                      ),
                    ],
                  )
              ),
            ),
            SizedBox(height: 50),
            Text("Welcome Back!",
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'PromptBold',
              color: Color.fromARGB(255, 149, 83, 241),
            ),),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 50),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),
              child: TextField(
                style: TextStyle(color: Color.fromARGB(255, 149, 83, 241)),
                controller: controllerEmail,
                cursorColor: Color.fromARGB(255, 149, 83, 241),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 149, 83, 241),
                  ),
                  hintText: "Enter Email",hintStyle: TextStyle(
                    fontFamily: 'PromptRegular',
                    fontSize: 18,
                    color: Color.fromARGB(255, 202, 161, 240),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),
              child: TextField(
                style: TextStyle(color: Color.fromARGB(255, 149, 83, 241)),
                controller: controllerPass,
                cursorColor: Color.fromARGB(255, 149, 83, 241),
                decoration: InputDecoration(
                  focusColor: Color.fromARGB(255, 149, 83, 241),
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color.fromARGB(255, 149, 83, 241),
                  ),
                  hintText: "Enter Password",hintStyle: TextStyle(
                    fontFamily: 'PromptRegular',
                    fontSize: 18,
                    color: Color.fromARGB(255, 202, 161, 240),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Write Click Listener Code Here
                },
                child: Text("Forgot Password?",
                style: TextStyle(
                  color: Color.fromARGB(255, 149, 83, 241),
                  fontSize: 16,
                  fontFamily: 'PromptRegular'
                ),),
              ),
            ),

            GestureDetector(
              onTap: () {
               login(controllerEmail.text, controllerPass.text);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 149, 83, 241),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'PromptMedium'
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  color: Color(0xFFF0F0),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Color.fromARGB(255, 149, 83, 241,
                    ),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontFamily: 'PromptMedium',
                    fontSize: 18,
                      color: Color.fromARGB(255, 149, 83, 241,)
                  ),
                ),
              ),
            ),

          ],
        )
      )
    );
  }
}