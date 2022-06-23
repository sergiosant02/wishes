import 'dart:convert';

import 'package:wishes/src/constant/constantes.dart';
import 'package:wishes/src/models/Book.dart';
import 'package:http/http.dart' as http;

class BookApi {
  final urlBook = Constantes.urlApi + "/books";

  static Future<List<Book>> getBooks() async {
    List<Book> lsBook = [];
    try {
      Uri _uri = Uri.parse(Constantes.urlBook);
      final resp = await http.get(_uri);
      final decode = json.decode(resp.body);
      for (var i in decode) {
        lsBook.add(Book.fromMap(i));
      }
      print(lsBook);
    } catch (e) {
      print(e);
    }
    return lsBook;
  }

  static Future<void> postBooks(Book book) async {
    try {
      Uri _uri = Uri.parse(Constantes.urlBook);
      await http.post(_uri, body: book.toMap());
    } catch (e) {
      print(e);
      //resp = e;
    }
  }

  static Future<Book> getBookId(String id) async {
    Book book;

    Uri _uri = Uri.parse(Constantes.urlBook + "/$id");
    final resp = await http.get(_uri);
    final decode = json.decode(resp.body);
    book = Book.fromMap(decode);

    return book;
  }

  static Future<void> deleteBookId(String id) async {
    Uri _uri = Uri.parse(Constantes.urlBook + "/$id");
    await http.delete(_uri);
  }
}
