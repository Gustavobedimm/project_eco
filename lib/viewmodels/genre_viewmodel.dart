import 'package:flutter/material.dart';
import 'package:project_eco/models/genre.dart';
import 'package:project_eco/services/genre_service.dart';

class GenreViewmodel extends ChangeNotifier {
  final GenreService _genreService = GenreService();

  List<Genre> _listGenre = [];
  List<Genre> get listGenre => _listGenre;

  String? _error;
  String? get error => _error;

  bool? _isLoading = false;
  bool? get isLoading => _isLoading;

  Future<void> fetchGenres() async {
    _isLoading = true;
    notifyListeners();

    try {
      _listGenre = await _genreService.fetchGenres();
      Genre filterAll = Genre(id: 0, name: 'Todos');
      _listGenre.insert(0, filterAll); 
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
