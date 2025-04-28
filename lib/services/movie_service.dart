import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';

class MovieService {
  final String _apiKey = '37f971fc0f075721f985988956a2c03d';

  Future<List<Movie>> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=pt-BR'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List movies = data['results'];
      return movies.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar filmes');
    }
  }

Future<List<Movie>> fetchUpComingMovies() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey&language=pt-BR'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List movies = data['results'];
      return movies.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar filmes');
    }
  }
  Future<List<Movie>> fetchNowMovies() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=$_apiKey&language=pt-BR'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List movies = data['results'];
      return movies.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar filmes');
    }
  }
}