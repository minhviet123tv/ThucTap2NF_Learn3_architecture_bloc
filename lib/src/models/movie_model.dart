
//I. Model của API từ trang api.themoviedb.org
class MovieData {
  // Các dữ liệu theo key sẽ lấy về từ file Json (API)
  late int _page;
  late int _total_results;
  late int _total_pages;
  late List<Movie> _listMovie = [];

  // Thực hiện lấy dữ liệu cho _listMovie
  MovieData.fromMyJson(Map<String, dynamic> json) {

    print(json['results'].length); // Số lượng item có trong results
    _page = json['page'];
    _total_results = json['total_results'];
    _total_pages = json['total_pages'];

    List<Movie> tempListMovie = [];

    // Lấy các dữ liệu (chính) trong results của API vào danh sách
    for (int i = 0; i < json['results'].length; i++) {
      Movie movie = Movie(json['results'][i]);
      tempListMovie.add(movie);
    }

    _listMovie = tempListMovie;
  }

  List<Movie> get listMovie => _listMovie;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;
}

//II. Model dữ liệu của 1 movie (là đối tượng trong key 'result' của API)
class Movie {
  late int _vote_count;
  late int _id;
  late bool _video;
  late var _vote_average;
  late String _title;
  late double _popularity;
  late String _poster_path;
  late String _original_language;
  late String _original_title;
  late List<int> _genre_ids = [];
  late String _backdrop_path;
  late bool _adult;
  late String _overview;
  late String _release_date;

  Movie(result) {
    _vote_count = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _vote_average = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _poster_path = result['poster_path'];
    _original_language = result['original_language'];
    _original_title = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genre_ids.add(result['genre_ids'][i]);
    }
    _backdrop_path = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _release_date = result['release_date'];
  }

  String get release_date => _release_date;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdrop_path => _backdrop_path;

  List<int> get genre_ids => _genre_ids;

  String get original_title => _original_title;

  String get original_language => _original_language;

  String get poster_path => _poster_path;

  double get popularity => _popularity;

  String get title => _title;

  double get vote_average => _vote_average;

  bool get video => _video;

  int get id => _id;

  int get vote_count => _vote_count;
}
