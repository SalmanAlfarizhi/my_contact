import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 149, 83, 241),
        title: const Text(
          "About Apps ",
          style: TextStyle(
            fontFamily: 'PromptSemiBold',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/images/logoabout.png'),
                  // backgroundColor: Color.fromARGB(255, 149, 83, 241),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Mycontact Apps",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'PromptSemibold',
                    color: Color.fromARGB(255, 149, 83, 241),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Nama : Salman Alfarizhi\nNIM : 200605110178\nMatakuliah : Praktikum Mobile Programming - G\n----------------------------------------------------------------------------\nAplikasi ini merupakan sebuah aplikasi kontak yang memudahkan user untuk dapat menyimpan nomor kontak secara langsung di dalam aplikasi dengan mudah.Aplikasi ini dibuat guna menyelesaikan tugas akhir semeter mata kuliah Praktikum Mobile Programming",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'PromptRegular',
                    color: Color.fromARGB(255, 149, 83, 241),
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                GestureDetector(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => LoginPage()),
                  //   );
                  // },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 0, right: 0, top: 10),
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
                      "Follow Us!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'PromptMedium'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
