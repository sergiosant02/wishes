import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wishes/src/Components/ListTitleSeleccion.dart';
import 'package:wishes/src/api/bookApi.dart';
import 'package:wishes/src/models/Book.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: FutureBuilder(
          future: BookApi.getBooks(),
          builder: (context, AsyncSnapshot<List<Book>> data) {
            List<Book> books = data.data == null ? [] : data.data!;
            if (books.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, i) {
                  Book book = books[i];

                  return ListTitleSeleccion.listTitleSeleccion(context,
                      title: book.title,
                      subtitle: book.author,
                      trailing: Text("Puntuación: " + book.rate.toString()));
                });
          }),
    );
  }
}
