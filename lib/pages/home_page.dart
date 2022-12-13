import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_contact/Model/contact_model.dart';
import 'package:my_contact/Service/contact_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_contact/pages/about_page.dart';
import 'package:my_contact/pages/add_page.dart';
import 'package:my_contact/Model/user_model.dart';
import 'package:my_contact/pages/detail_page.dart';
import 'package:my_contact/pages/login_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_contact/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  int user;
  HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //   Future<void> deleteData(int id) async {
  //   var response = await Dio().delete(
  //     options: Options(
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //     ),
  //     "$baseurl/data/$id",
  //   );
  //   print(response.statusCode);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 149, 83, 241),
        title: const Text(
          "Contact List",
          style: TextStyle(
            fontFamily: 'PromptSemiBold',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(user: widget.user),
                      ));
                },
                child: Icon(
                  Icons.refresh,
                  size: 26.0,
                ),
              )),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 149, 83, 241),
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(child: Image.asset('assets/images/welcome.png')),
              ),
              ListTile(
                leading: Image.asset("assets/images/Home.png"),
                title: Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'PromptRegular',
                      color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(user: widget.user)),
                  );
                },
              ),
              ListTile(
                leading: Image.asset("assets/images/Profile.png"),
                title: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'PromptRegular',
                      color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(user: widget.user)),
                  );
                },
              ),
              ListTile(
                leading: Image.asset("assets/images/Info.png"),
                title: Text(
                  'About',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'PromptRegular',
                      color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
              ),
              ListTile(
                leading: Image.asset("assets/images/Logout.png"),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'PromptRegular',
                      color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
          child: FutureBuilder<List<ContactModel>>(
              future: ContactService.fetchContact(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: LoadingAnimationWidget.waveDots(
                    color: Color.fromARGB(255, 149, 83, 241),
                    size: 50,
                  ));
                } else {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    // kok ga bisa di refactor ya
                    // list view builder nya, wrap wid
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      padding: EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          contact: ContactModel(
                                              username:
                                                  "${snapshot.data?[index].username}",
                                              number:
                                                  "${snapshot.data?[index].number}",
                                              id: int.parse(
                                                  "${snapshot.data?[index].id}")),
                                          letter:
                                              "${snapshot.data?[index].username[0]}",
                                          user: widget.user,
                                        )));
                          },
                          child: Card(
                            // ga ada center ya
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color: Color.fromARGB(255, 149, 83, 241)
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                    child: new Text(
                                      '${snapshot.data![index].username[0]}',
                                      style: TextStyle(
                                          fontFamily: 'PromptMedium',
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 149, 83, 241)),
                                title: Text(
                                  '${snapshot.data![index].username}',
                                  style: TextStyle(
                                      fontFamily: 'PromptMedium',
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 149, 83, 241)),
                                ),
                                subtitle: Text(
                                  '${snapshot.data![index].number}',
                                  style: TextStyle(
                                      fontFamily: 'PromptRegular',
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 149, 83, 241)),
                                ),
                                // trailing: Image.asset(
                                //   'assets/images/Delete.png',
                                //   width: 18,
                                //   height: 20,
                                // ),
                                // iconColor: Colors.red,
                                // onTap: () async {
                                //   // await ContactService().deleteContact(data!.id);
                                // },
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
              })),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AddPage(user: widget.user)),
            );
          },
          label: const Text('Add'),
          icon: const Icon(Icons.add_circle),
          backgroundColor: Color.fromARGB(255, 149, 83, 241)),
    );
  }
}
