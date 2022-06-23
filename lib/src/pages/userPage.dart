import 'package:flutter/material.dart';
import 'package:wishes/src/Components/ListTitleSeleccion.dart';
import 'package:wishes/src/api/UserApi.dart';
import 'package:wishes/src/models/User.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: FutureBuilder(
          future: UserApi.getUsers(),
          builder: (context, AsyncSnapshot<List<User>> data) {
            List<User> users = data.data == null ? [] : data.data!;
            if (users.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, i) {
                  User user = users[i];
                  return ListTitleSeleccion.listTitleSeleccion(context,
                      title: user.name, subtitle: user.email);
                });
          }),
    );
  }
}
