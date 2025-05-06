import 'package:project_eco/models/genre.dart';

class GenreState {
  final List<Genre> listGenre;
  final bool isLoading;
  final String? error;

  GenreState({
    this.listGenre = const [],
    this.isLoading = false,
    this.error,
  });

  GenreState copyWith({
    List<Genre>? listGenre,
    bool? isLoading,
    String? error,
  }) {
    return GenreState(
      listGenre: listGenre ?? this.listGenre,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
