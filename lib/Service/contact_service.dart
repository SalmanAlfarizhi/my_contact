import "package:dio/dio.dart";
import 'package:flutter/material.dart';
import 'package:my_contact/Model/contact_model.dart';
import 'package:my_contact/Model/user_model.dart';
import 'package:my_contact/pages/home_page.dart';

String baseurl = 'http://192.168.1.71:3000';
// String baseurl = 'http://localhost:3000';

class ContactService {
  static Future<List<ContactModel>> fetchContact() async {
    Response response = await Dio().get("$baseurl/data");

    List<ContactModel> contacts =
        (response.data as List).map((v) => ContactModel.fromJSON(v)).toList();
    return contacts;
  }

  // Future<ContactModel> deleteContact(int id) async {
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

  //   Future<ContactModel> deleteContact(int id) async {
  //   Response response = await Dio().get('$baseurl/data/$id');
  //   ContactModel users = ContactModel.fromJSON(response.data);
  //   return users;
  // }

  static void deleteContact(int id) async {
    try {
      Response response = await Dio().delete('$baseurl/data/' + id.toString());
      if (response.statusCode == 200) {
        print("Delete Success");

      } else {
        print("Delete Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserModel> fetchUser(int id) async {
    Response response = await Dio().get('$baseurl/users/$id');
    UserModel users = UserModel.fromJSON(response.data);
    return users;
  }
}
