import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_contact/pages/home_page.dart';

class AddPage extends StatefulWidget {
  int user;
  AddPage({Key? key, required this.user}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerNumber = TextEditingController();

  void addcontact(String name, number) async {
    try {
      var response = await Dio().post('http://localhost:3000/data',
          data: {"username": name, "number": number});

      // var response = await Dio().post('http://192.168.1.71:3000/data',
      //     data: {"username": name, "number": number});

      if (response.statusCode == 201) {
        final snackBar = SnackBar(
          backgroundColor: Color.fromARGB(255, 149, 83, 241),
          content: Text(
            'Add Contact Success',
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        controllerName.clear();
        controllerNumber.clear();
        print("Add Contact Success");
      } else {
        print("Add Data Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 149, 83, 241),
        title: const Text(
          "New Contact",
          style: TextStyle(
            fontFamily: 'PromptSemiBold',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(user: widget.user)),
            );
          },
        ),
        actions: const [],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 35, right: 35, top: 30),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              'Add New Contact\nTo Phone!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'PromptBold',
                color: Color.fromARGB(255, 149, 83, 241),
              ),
            ),
            TextFormField(
              style: TextStyle(
                  fontFamily: 'PromptMedium',
                  fontSize: 16,
                  color: Color.fromARGB(255, 149, 83, 241)),
              controller: controllerName,
              decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 149, 83, 241),
                    fontFamily: 'PromptMedium',
                    fontSize: 14,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 149, 83, 241),
                    ),
                  ),
                  helperText: "What's your name?",
                  helperStyle: TextStyle(
                    color: Color.fromARGB(255, 185, 144, 242),
                    fontFamily: 'PromptRegular',
                    fontSize: 10,
                  )),
            ),
            TextFormField(
              style: TextStyle(
                  fontFamily: 'PromptMedium',
                  fontSize: 16,
                  color: Color.fromARGB(255, 149, 83, 241)),
              controller: controllerNumber,
              decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    fontFamily: 'PromptMedium',
                    fontSize: 14,
                    color: Color.fromARGB(255, 149, 83, 241),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 149, 83, 241),
                    ),
                  ),
                  helperText: "What's your number?",
                  helperStyle: TextStyle(
                    color: Color.fromARGB(255, 185, 144, 242),
                    fontFamily: 'PromptRegular',
                    fontSize: 10,
                  )),
            ),
            GestureDetector(
              onTap: () {
                addcontact(controllerName.text, controllerNumber.text);
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
                  "Add Contact",
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
                      builder: (context) => HomePage(user: widget.user)),
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
          ],
        ),
      ),
    );
  }
}
