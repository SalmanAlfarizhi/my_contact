import "package:dio/dio.dart";
import 'package:my_contact/Model/contact_model.dart';

class ContactService{
static Future<List<ContactModel>>fetchContact()async{
  Response response = await Dio().get("http://localhost:3000/contact");
  
  List<ContactModel> contacts = (response.data as List).map((v) => ContactModel.fromJSON(v)).toList();
  return contacts;
}
}
