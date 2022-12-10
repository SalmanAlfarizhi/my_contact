import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_contact/Model/user_model.dart';
import 'package:my_contact/Service/contact_service.dart';
import 'package:my_contact/pages/home_page.dart';
import 'package:my_contact/pages/login_page.dart';

class ProfilePage extends StatefulWidget {
  int user;
  ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 149, 83, 241),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<UserModel>(
          future: ContactService().fetchUser(widget.user),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(children: <Widget>[
                      const SizedBox(
                        height: 40,
                      ),
                      CircleAvatar(
                          child: new Text(
                            '${snapshot.data!.name[0]}',
                            style: TextStyle(
                                fontFamily: 'PromptMedium',
                                fontSize: 40,
                                color: Colors.white),
                          ),
                          radius: 50,
                          backgroundColor: Color.fromARGB(255, 149, 83, 241)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        snapshot.data!.name,
                        style: TextStyle(
                            color: Color.fromARGB(255, 149, 83, 241),
                            fontSize: 24,
                            fontFamily: 'PromptMedium'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        snapshot.data!.email,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 149, 83, 241),
                          fontSize: 16,
                          fontFamily: 'PromptRegular'
                        ),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
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
                            color: Color.fromARGB(255, 149, 83, 241),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50,
                                  color: Color(0xffEEEEEE)),
                            ],
                          ),
                          child: Text(
                            "Logout",
                            style: TextStyle(
                                color: Colors.white,
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
                                builder: (context) =>
                                    HomePage(user: widget.user)),
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
                              color: Color.fromARGB(
                                255,
                                149,
                                83,
                                241,
                              ),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50,
                                  color: Color(0xffEEEEEE)),
                            ],
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: Color.fromARGB(255, 149, 83, 241),
                                fontSize: 18,
                                fontFamily: 'PromptMedium'),
                          ),
                        ),
                      ),
                    ]),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
