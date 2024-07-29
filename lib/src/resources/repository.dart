import 'dart:async';
import 'movie_api_provider.dart';
import '../models/movie_model.dart';

// Tạo sẵn MovieApiProvider lấy dữ liệu từ API
class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<MovieData> getMovieData() => moviesApiProvider.getMovieData();
}
