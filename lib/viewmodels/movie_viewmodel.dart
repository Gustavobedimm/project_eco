import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';

class MovieViewModel extends ChangeNotifier {
  final MovieService _service = MovieService();

  List<Movie> _moviesPopular = []; 
  List<Movie> _filteredMoviesPopular = [];
  List<Movie> _moviesUpComing = []; 
  List<Movie> _filteredMoviesUpComing = [];
  List<Movie> _moviesNow = []; 
  List<Movie> _filteredMoviesNow = [];

  bool _isLoading = false;
  String? _error;

  List<Movie> get moviesPopular => _filteredMoviesPopular;
  List<Movie> get moviesUpComing => _filteredMoviesUpComing;
  List<Movie> get moviesNow => _filteredMoviesNow;


  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchMoviesPopular() async {
    _isLoading = true;
    notifyListeners();

    try {
      _moviesPopular = await _service.fetchPopularMovies();
      _filteredMoviesPopular = _moviesPopular;
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


Future<void> fetchMoviesUpComing() async {
    _isLoading = true;
    notifyListeners();

    try {
      _moviesUpComing = await _service.fetchUpComingMovies();
      _filteredMoviesUpComing = _moviesUpComing;
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<void> fetchMoviesNow() async {
    _isLoading = true;
    notifyListeners();

    try {
      _moviesNow = await _service.fetchNowMovies();
      _filteredMoviesNow = _moviesNow;
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
      _filteredMoviesPopular = _moviesPopular;
      _filteredMoviesUpComing = _moviesUpComing;
    } else {
      _filteredMoviesPopular = _moviesPopular.where((movie) => movie.genreIds.contains(genreId)).toList();
      _filteredMoviesUpComing = _moviesUpComing.where((movie) => movie.genreIds.contains(genreId)).toList();
    }
    notifyListeners();
  }
}
