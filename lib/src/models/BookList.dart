import 'dart:convert';

import 'package:wishes/src/models/Book.dart';

class BookList {
  BookList({
    required this.id,
    required this.name,
    required this.description,
    required this.books,
  });

  String id;
  String name;
  String description;
  List<Book> books;

  factory BookList.fromJson(String str) => BookList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookList.fromMap(Map<String, dynamic> json) => BookList(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        books: List<Book>.from(json["books"].map((x) => Book.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "books": List<dynamic>.from(books.map((x) => x.toMap())),
      };

  @override
  String toString() {
    // TODO: implement toString
    return "BookList: [id: $id, name: $name, description: $description, books: $books]";
  }
}
