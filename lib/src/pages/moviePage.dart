import 'package:flutter/material.dart';
import 'package:wishes/src/Components/ListTitleSeleccion.dart';
import 'package:wishes/src/Components/MovieListTitle.dart';
import 'package:wishes/src/api/MovieApi.dart';
import 'package:wishes/src/models/Movie.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: FutureBuilder(
          future: MoviesApi.getMovies(),
          builder: (context, AsyncSnapshot<List<Result>> data) {
            List<Result> movies = data.data == null ? [] : data.data!;
            if (movies.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: movies.length,
                itemExtent: MediaQuery.of(context).size.height * 0.3,
                itemBuilder: (context, i) {
                  final Result movie = movies[i];
                  return MovieListTitle.listTitleSeleccion2(context,
                      title: movie.title,
                      id: movie.id,
                      subtitle: movie.overview,
                      fotoUrl: movie.posterPath,
                      trailing: Text(
                        "Votos ${movie.voteCount}",
                        maxLines: 10,
                      ));
                });
          }),
    );
  }
}
