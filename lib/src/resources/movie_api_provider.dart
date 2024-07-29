import 'dart:async';
import 'package:http/http.dart' as http; // hoặc show Client | Client client = Client();
import 'dart:convert';

import '../models/movie_model.dart';

// Cung cấp phương thức lấy dữ liệu của API
class MovieApiProvider {

  final _apiKey = 'fdc7e0e8c8e8ada6263aa975d19e191b'; // your_api_key

  // hàm thực hiện lấy dữ liệu từ API, trả về 1 model là MovieData
  Future<MovieData> getMovieData() async {

    final response = await http.get(Uri.parse("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"));

    if (response.statusCode == 200) {
      // Nếu cuộc gọi đến máy chủ thành công, Thực hiện lấy dữ liệu cho list của ItemModel
      return MovieData.fromMyJson(json.decode(response.body));
    } else {
      // Nếu cuộc gọi đó không thành công, báo lỗi.
      throw Exception('Failed to load API');
    }
  }
}
