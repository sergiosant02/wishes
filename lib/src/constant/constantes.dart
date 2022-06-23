import 'package:flutter/material.dart';

class Constantes {
  static const String urlApi = "https://wishesv2.oa.r.appspot.com/api/v2";
  static const String urlBook = urlApi + "/books";
  static const String urlBookList = urlApi + "/booklist";
  static const String urlUser = urlApi + "/users";
  static const String urlMovies =
      "https://api.themoviedb.org/3/movie/popular?api_key=c00b192fdcd2c592093704c75356d684&language=es-ES&page=1";
  static const String filmPlacePath = "assets/filmPlace.png";
  static const String urlMoviesPhoto = "https://image.tmdb.org/t/p/w200";
  static const String estadisticasGenerales = urlApi + "/users/stadistic";
  static const TextStyle titulos =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);
}
