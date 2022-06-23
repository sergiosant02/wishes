import 'package:flutter/material.dart';
import 'package:wishes/src/constant/constantes.dart';

class ListTitleSeleccion {
  static Widget listTitleSeleccion(BuildContext context,
      {required String title,
      String? subtitle,
      String? route,
      Widget? trailing,
      TextStyle? tituloStyle}) {
    return ListTile(
      title: Text(
        title,
        style: tituloStyle ?? (route == null ? Constantes.titulos : null),
      ),
      subtitle: subtitle == null ? null : Text(subtitle),
      onTap: () {
        route != null ? Navigator.pushNamed(context, route) : null;
      },
      trailing: trailing ??
          (route != null ? const Icon(Icons.keyboard_arrow_right) : null),
    );
  }
}
