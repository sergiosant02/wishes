import 'package:flutter/material.dart';
import 'package:wishes/src/Components/ListTitleSeleccion.dart';

class SeleccionPage extends StatelessWidget {
  const SeleccionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> secciones = [
      "Books",
      "BookLists",
      "Movies",
      "Users",
      "Stadistics"
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Whishes')),
      body: ListView(
        children: secciones
            .map((String e) => ListTitleSeleccion.listTitleSeleccion(context,
                title: e, route: "/$e"))
            .toList(),
      ),
    );
  }
}
