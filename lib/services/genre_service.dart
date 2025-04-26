import 'dart:convert';
import 'package:project_eco/models/genre.dart';
import 'package:http/http.dart' as http;

class GenreService {
  final String _apiKey = '37f971fc0f075721f985988956a2c03d';

  Future<List<Genre>> fetchGenres() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/genre/movie/list?api_key=$_apiKey&language=pt-BR'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List genres = data['genres'];
      return genres.map((json) => Genre.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar filmes');
    }
  }
}