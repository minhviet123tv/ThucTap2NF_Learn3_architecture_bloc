import 'dart:async';

import '../resources/repository.dart';
import '../models/movie_model.dart';

class MoviesBloc {

  final _repository = Repository();
  final _moviesFetcher = StreamController<MovieData>(); // PublishSubject

  Stream<MovieData> get stream => _moviesFetcher.stream;
  Sink get sink => _moviesFetcher.sink;

  getMovieData() async {
    MovieData movieData = await _repository.getMovieData();
    sink.add(movieData);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
