abstract class MovieEvent {}

class FetchPopularMovies extends MovieEvent {}

class FetchUpcomingMovies extends MovieEvent {}

class FetchNowMovies extends MovieEvent {}

class FilterMoviesByGenre extends MovieEvent {
  final int genreId;
  FilterMoviesByGenre(this.genreId);
}

class FilterMoviesByText extends MovieEvent {
  final String text;
  FilterMoviesByText(this.text);
}
