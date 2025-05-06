import 'package:project_eco/models/movie.dart';

class MovieState {
  final List<Movie> popular;
  final List<Movie> upcoming;
  final List<Movie> now;

  final List<Movie> allPopular;
  final List<Movie> allUpcoming;
  final List<Movie> allNow;

  final int selectedGenre;

  final bool isLoading;
  final String? error;

  MovieState({
    this.popular = const [],
    this.upcoming = const [],
    this.now = const [],
    this.allPopular = const [],
    this.allUpcoming = const [],
    this.allNow = const [],
    this.selectedGenre = 0,
    this.isLoading = false,
    this.error,
  });

  MovieState copyWith({
    List<Movie>? popular,
    List<Movie>? upcoming,
    List<Movie>? now,
    List<Movie>? allPopular,
    List<Movie>? allUpcoming,
    List<Movie>? allNow,
    int? selectedGenre,
    bool? isLoading,
    String? error,
  }) {
    return MovieState(
      popular: popular ?? this.popular,
      upcoming: upcoming ?? this.upcoming,
      now: now ?? this.now,
      allPopular: allPopular ?? this.allPopular,
      allUpcoming: allUpcoming ?? this.allUpcoming,
      allNow: allNow ?? this.allNow,
      selectedGenre: selectedGenre ?? this.selectedGenre,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
