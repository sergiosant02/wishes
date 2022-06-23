import 'dart:convert';

class Book {
  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.year,
    required this.rate,
    required this.pagNumber,
    required this.publisher,
  });

  String id;
  String title;
  String author;
  String genre;
  int year;
  double rate;
  int pagNumber;
  String publisher;

  factory Book.fromJson(String str) => Book.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        genre: json["genre"],
        year: json["year"],
        rate: json["rate"].toDouble(),
        pagNumber: json["pagNumber"],
        publisher: json["publisher"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "author": author,
        "genre": genre,
        "year": year,
        "rate": rate,
        "pagNumber": pagNumber,
        "publisher": publisher,
      };

  @override
  String toString() {
    return "Book: [id: $id, title: $title, author: $author, genre: $genre, year: $year, $rate, pagNumber: $pagNumber, publisher: $publisher]";
  }
}
