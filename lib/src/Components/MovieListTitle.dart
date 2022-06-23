import 'package:flutter/material.dart';
import 'package:wishes/src/constant/constantes.dart';

class MovieListTitle {
  static Widget listTitleSeleccion(BuildContext context,
      {required String title,
      required int id,
      String? subtitle,
      String? fotoUrl,
      Widget? trailing}) {
    return ListTile(
      title: Text(title, style: Constantes.titulos),
      subtitle: subtitle == null
          ? null
          : Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
      leading: fotoUrl != null
          ? FadeInImage(
              fit: BoxFit.cover,
              height: 800,
              width: 50,
              placeholder: const AssetImage(Constantes.filmPlacePath),
              image:
                  NetworkImage(Constantes.urlMoviesPhoto + fotoUrl, scale: 1))
          : const Icon(Icons.keyboard_arrow_right),
      trailing: trailing,
    );
  }

  static Widget listTitleSeleccion2(BuildContext context,
      {required String title,
      required int id,
      String? subtitle,
      String? fotoUrl,
      Widget? trailing}) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 1)
      ]),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (fotoUrl != null)
            Flexible(
              flex: 4,
              child: FadeInImage(
                  fit: BoxFit.scaleDown,
                  height: MediaQuery.of(context).size.height * 0.3,
                  // width: 100,
                  placeholder: const AssetImage(Constantes.filmPlacePath),
                  image: NetworkImage(Constantes.urlMoviesPhoto + fotoUrl,
                      scale: 1)),
            )
          else
            const Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(Constantes.filmPlacePath)),
            ),
          Flexible(
            flex: 10,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    title,
                    style: Constantes.titulos,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (subtitle != null)
                    Expanded(
                      child: Text(subtitle,
                          maxLines: 10, overflow: TextOverflow.ellipsis),
                    ),
                ],
              ),
            ),
          ),
          Spacer(),
          if (trailing != null) trailing
        ],
      ),
    );
  }

  static Widget listTitleSeleccion3(BuildContext context,
      {required String title,
      required int id,
      String? subtitle,
      String? fotoUrl,
      Widget? trailing}) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 1)
      ]),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (fotoUrl != null)
            Align(
              alignment: Alignment.centerLeft,
              child: FadeInImage(
                  fit: BoxFit.scaleDown,
                  height: MediaQuery.of(context).size.height * 0.3,
                  // width: 100,
                  placeholder: const AssetImage(Constantes.filmPlacePath),
                  image: NetworkImage(Constantes.urlMoviesPhoto + fotoUrl,
                      scale: 1)),
            )
          else
            const Align(
              alignment: Alignment.centerLeft,
              child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(Constantes.filmPlacePath)),
            ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    title,
                    style: Constantes.titulos,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (subtitle != null)
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text(subtitle,
                          softWrap: true,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis),
                    ),
                ],
              ),
            ),
          ),
          const Spacer(),
          if (trailing != null)
            Align(alignment: Alignment.centerRight, child: trailing)
        ],
      ),
    );
  }
}
