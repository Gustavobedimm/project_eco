import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';

class MovieViewModel extends ChangeNotifier {
  final MovieService _service = MovieService();

  List<Movie> _movies = []; // Todos os filmes (completos)
  List<Movie> _filteredMovies = []; // Filmes filtrados
  bool _isLoading = false;
  String? _error;

  List<Movie> get movies => _filteredMovies;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();

    try {
      _movies = await _service.fetchPopularMovies();
      _filteredMovies = _movies;
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void filterMoviesByGenre(int genreId) {
    if (genreId == 0) {
      _filteredMovies = _movies;
    } else {
      _filteredMovies =
          _movies.where((movie) => movie.genreIds.contains(genreId)).toList();
    }
    notifyListeners();
  }
}
