import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/models/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic popular = jsonDecode(response.body);
      for (var movie in popular['results']) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowPlaying() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/now-playing');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic popular = jsonDecode(response.body);
      for (var movie in popular['results']) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingSoon() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/coming-soon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic popular = jsonDecode(response.body);
      for (var movie in popular['results']) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getDetailById(int id) async {
    final url = Uri.parse('$baseUrl/movie?id=$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
