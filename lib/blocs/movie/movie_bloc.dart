import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_eco/blocs/movie/movie_event.dart';
import 'package:project_eco/blocs/movie/movie_state.dart';
import 'package:project_eco/models/movie.dart';
import 'package:project_eco/services/movie_service.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieService _service;

  List<Movie> _originalPopular = [];
  List<Movie> _originalUpcoming = [];
  List<Movie> _originalNow = [];

  MovieBloc(this._service) : super(MovieState()) {
    on<FetchPopularMovies>(_fetchPopular);
    on<FetchUpcomingMovies>(_fetchUpcoming);
    on<FetchNowMovies>(_fetchNow);
    on<FilterMoviesByGenre>(_filterByGenre);
    on<FilterMoviesByText>(_filterByText);
  }

  Future<void> _fetchPopular(FetchPopularMovies event, Emitter<MovieState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final movies = await _service.fetchPopularMovies();
      _originalPopular = movies;
      emit(state.copyWith(popular: movies, isLoading: false, error: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _fetchUpcoming(FetchUpcomingMovies event, Emitter<MovieState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final movies = await _service.fetchUpComingMovies();
      _originalUpcoming = movies;
      emit(state.copyWith(upcoming: movies, isLoading: false, error: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _fetchNow(FetchNowMovies event, Emitter<MovieState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final movies = await _service.fetchNowMovies();
      _originalNow = movies;
      emit(state.copyWith(now: movies, isLoading: false, error: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void _filterByGenre(FilterMoviesByGenre event, Emitter<MovieState> emit) {
    if (event.genreId == 0) {
      emit(state.copyWith(
        popular: _originalPopular,
        upcoming: _originalUpcoming,
        now: _originalNow,
        selectedGenre: 0
        
      ));
    } else {
      emit(state.copyWith(
        popular: _originalPopular.where((m) => m.genreIds.contains(event.genreId)).toList(),
        upcoming: _originalUpcoming.where((m) => m.genreIds.contains(event.genreId)).toList(),
        now: _originalNow.where((m) => m.genreIds.contains(event.genreId)).toList(),
        selectedGenre: event.genreId
      ));
    }
  }

  void _filterByText(FilterMoviesByText event, Emitter<MovieState> emit) {
    if (event.text.isEmpty) {
      emit(state.copyWith(popular: _originalPopular));
    } else {
      emit(state.copyWith(
        popular: _originalPopular
            .where((m) => m.title.toLowerCase().contains(event.text.toLowerCase()))
            .toList(),
      ));
    }
  }
}

