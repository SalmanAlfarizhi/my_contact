import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
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
        actions: const [],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 50, right: 50, top: 30),
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
                // login(controllerEmail.text, controllerPass.text);
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
                // login(controllerEmail.text, controllerPass.text);
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
