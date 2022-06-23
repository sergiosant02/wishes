import 'dart:convert';

import 'package:wishes/src/constant/constantes.dart';
import 'package:wishes/src/models/BookList.dart';
import 'package:http/http.dart' as http;

class BookListApi {
  final urlBookList = Constantes.urlApi + "/BookLists";

  static Future<List<BookList>> getBookLists() async {
    List<BookList> lsBookList = [];
    try {
      Uri _uri = Uri.parse(Constantes.urlBookList);
      final resp = await http.get(_uri);
      final decode = json.decode(resp.body);
      for (var i in decode) {
        lsBookList.add(BookList.fromMap(i));
      }
      print(lsBookList);
    } catch (e) {
      print(e);
    }
    return lsBookList;
  }

  static Future<void> postBookLists(BookList bookList) async {
    try {
      Uri _uri = Uri.parse(Constantes.urlBookList);
      await http.post(_uri, body: bookList.toMap());
    } catch (e) {
      print(e);
      //resp = e;
    }
  }

  static Future<BookList> getBookListId(String id) async {
    BookList bookList;

    Uri _uri = Uri.parse(Constantes.urlBookList + "/$id");
    final resp = await http.get(_uri);
    final decode = json.decode(resp.body);
    bookList = BookList.fromMap(decode);

    return bookList;
  }

  static Future<void> deleteBookListId(String id) async {
    Uri _uri = Uri.parse(Constantes.urlBookList + "/$id");
    await http.delete(_uri);
  }
}
