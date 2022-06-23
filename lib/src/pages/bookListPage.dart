import 'package:flutter/material.dart';
import 'package:wishes/src/Components/ListTitleSeleccion.dart';
import 'package:wishes/src/api/bookApi.dart';
import 'package:wishes/src/api/bookListApi.dart';
import 'package:wishes/src/constant/constantes.dart';
import 'package:wishes/src/models/Book.dart';
import 'package:wishes/src/models/BookList.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookList'),
      ),
      body: FutureBuilder(
          future: BookListApi.getBookLists(),
          builder: (context, AsyncSnapshot<List<BookList>> data) {
            List<BookList> bookLists = data.data == null ? [] : data.data!;
            if (bookLists.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: bookLists.length,
                itemBuilder: (context, i) {
                  BookList bookList = bookLists[i];
                  return ExpansionTile(
                    collapsedTextColor: Colors.black,
                    title: Text(
                      bookList.name,
                    ),
                    children: bookList.books
                        .map((e) => ListTitleSeleccion.listTitleSeleccion(
                            context,
                            title: e.title,
                            subtitle: e.author,
                            tituloStyle: TextStyle(fontSize: 14)))
                        .toList(),
                  );
                });
          }),
    );
  }
}
