import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../blocs/movies_bloc.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    bloc.getMovieData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.stream,
        builder: (context, AsyncSnapshot<MovieData> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<MovieData> snapshot) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1/1.5,
        children: List.generate(snapshot.data?.listMovie.length ?? 0, (index) {
          return Container(
            padding: index.isEven ? const EdgeInsets.only(right: 1, bottom: 1, top: 1) : const EdgeInsets.only(left: 1, bottom: 1, top: 1),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${snapshot.data?.listMovie[index].poster_path}',
                fit: BoxFit.cover,
              ),
            ),
          );
        },),
      ),
    );
  }
}
