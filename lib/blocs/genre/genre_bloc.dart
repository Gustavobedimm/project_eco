import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_eco/blocs/genre/genre_event.dart';
import 'package:project_eco/blocs/genre/genre_state.dart';
import 'package:project_eco/services/genre_service.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final GenreService _service;


  GenreBloc(this._service) : super(GenreState()) {
    on<FetchGenres>(_fetchGenre);
  }

  Future<void> _fetchGenre(FetchGenres event, Emitter<GenreState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final genres = await _service.fetchGenres();
      emit(state.copyWith(listGenre: genres, isLoading: false, error: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

}

