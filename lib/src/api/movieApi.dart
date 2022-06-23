import 'dart:convert';

import 'package:wishes/src/constant/constantes.dart';
import 'package:wishes/src/models/Movie.dart';
import 'package:http/http.dart' as http;

class MoviesApi {
  final urlMovies = Constantes.urlApi + "/Moviess";

  static Future<List<Result>> getMovies() async {
    List<Result> lsMovies = [];
    try {
      Uri _uri = Uri.parse(Constantes.urlMovies);
      final resp = await http.get(_uri);
      final decode = json.decode(resp.body);
      lsMovies.addAll(Movies.fromMap(decode).results);

      print(lsMovies);
    } catch (e) {
      print(e);
    }
    return lsMovies;
  }
}
