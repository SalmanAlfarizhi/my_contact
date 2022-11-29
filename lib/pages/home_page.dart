import 'package:flutter/material.dart';
import 'package:my_contact/Model/contact_model.dart';
import 'package:my_contact/Service/contact_service.dart';

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
          title: const Text("Dashboard"),
          actions: const [],
        ),
        body: FutureBuilder<List<ContactModel>>(
          future: ContactService.fetchContact(),
          builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: const NetworkImage(
                          "https://i.ibb.co/QrTHd59/woman.jpg",
                        ),
                      ),
                      title: Text('${snapshot.data![index].username}'),
                      subtitle: Text('${snapshot.data![index].number}'),
                    ),
                  );
                },
              );
            }
          }
        }));
  }
}
