import 'package:flutter/material.dart';
import 'package:my_contact/Model/contact_model.dart';
import 'package:my_contact/Service/contact_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_contact/pages/add_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 149, 83, 241),
        title: const Text(
          "Home",
          style: TextStyle(
            fontFamily: 'PromptSemiBold',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        actions: const [],
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
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      padding: EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return Card(
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
                                      Color.fromARGB(255, 149, 83, 241)
                                  // backgroundImage: const NetworkImage(
                                  //   "https://i.ibb.co/QrTHd59/woman.jpg",
                                  // ),
                                  ),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPage()),
            );
          },
          label: const Text('Add'),
          icon: const Icon(Icons.add_circle),
          backgroundColor: Color.fromARGB(255, 149, 83, 241)),
    );
  }
}
