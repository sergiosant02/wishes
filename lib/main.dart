import 'package:flutter/material.dart';
import 'package:wishes/src/api/bookApi.dart';
import 'package:wishes/src/api/bookListApi.dart';
import 'package:wishes/src/api/estadisticasApi.dart';
import 'package:wishes/src/api/movieApi.dart';
import 'package:wishes/src/api/userApi.dart';
import 'package:wishes/src/pages/bookListPage.dart';
import 'package:wishes/src/pages/booksPage.dart';
import 'package:wishes/src/pages/estadisticasPage.dart';
import 'package:wishes/src/pages/moviePage.dart';
import 'package:wishes/src/pages/seleccionPage.dart';
import 'package:wishes/src/pages/userPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EstadisticasApi.getGeneralEstadisticas();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/seleccion',
      routes: {
        '/seleccion': (context) => const SeleccionPage(),
        '/Books': (context) => const BooksPage(),
        '/BookLists': (context) => const BookListPage(),
        '/Movies': (context) => const MoviePage(),
        '/Users': (context) => const UsersPage(),
        '/Stadistics': (context) => const EstadisticasPage()
      },
    );
  }
}
