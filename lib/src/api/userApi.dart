import 'dart:convert';

import 'package:wishes/src/constant/constantes.dart';
import 'package:wishes/src/models/User.dart';
import 'package:http/http.dart' as http;

class UserApi {
  final urlUser = Constantes.urlApi + "/Users";

  static Future<List<User>> getUsers() async {
    List<User> lsUser = [];
    try {
      Uri _uri = Uri.parse(Constantes.urlUser);
      final resp = await http.get(_uri);
      final decode = json.decode(resp.body);
      for (var i in decode) {
        lsUser.add(User.fromMap(i));
      }
      print(lsUser);
    } catch (e) {
      print(e);
    }
    return lsUser;
  }

  static Future<void> postUsers(User user) async {
    try {
      Uri _uri = Uri.parse(Constantes.urlUser);
      await http.post(_uri, body: user.toMap());
    } catch (e) {
      print(e);
      //resp = e;
    }
  }

  static Future<User> getUserId(String id) async {
    User user;

    Uri _uri = Uri.parse(Constantes.urlUser + "/$id");
    final resp = await http.get(_uri);
    final decode = json.decode(resp.body);
    user = User.fromMap(decode);

    return user;
  }

  static Future<void> deleteUserId(String id) async {
    Uri _uri = Uri.parse(Constantes.urlUser + "/$id");
    await http.delete(_uri);
  }
}
