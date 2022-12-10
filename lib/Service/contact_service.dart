import "package:dio/dio.dart";
import 'package:my_contact/Model/contact_model.dart';
import 'package:my_contact/Model/user_model.dart';

String baseurl = 'http://localhost:3000';

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

    Future<ContactModel> deleteContact(int id) async {
    Response response = await Dio().get('$baseurl/data/$id');
    ContactModel users = ContactModel.fromJSON(response.data);
    return users;
  }

  Future<UserModel> fetchUser(int id) async {
    Response response = await Dio().get('$baseurl/users/$id');
    UserModel users = UserModel.fromJSON(response.data);
    return users;
  }
}
