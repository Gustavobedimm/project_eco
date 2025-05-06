import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_eco/blocs/genre/genre_bloc.dart';
import 'package:project_eco/blocs/genre/genre_state.dart';
import 'package:project_eco/blocs/movie/movie_bloc.dart';
import 'package:project_eco/blocs/movie/movie_event.dart';
import 'package:project_eco/blocs/movie/movie_state.dart';

class GenreFilter extends StatefulWidget {
  const GenreFilter({super.key});

  @override
  State<GenreFilter> createState() => _GenreFilterState();
}

class _GenreFilterState extends State<GenreFilter> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GenreBloc, GenreState>(
      builder: (context, state) {
        if(state.isLoading){
          return Center(child: CircularProgressIndicator());
        }
        if(state.listGenre.isEmpty){
          return Center(child: Text("Nenhum genero encontrado."));
        }
        return BlocBuilder<MovieBloc, MovieState>(
          builder: (context, movieState) {
          final selectedGenreId = movieState.selectedGenre;

      return SizedBox(
        height: 50, // altura do badge
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.listGenre.length,
          itemBuilder: (context, index) {
            final genre = state.listGenre[index];
            final isSelected = genre.id == selectedGenreId;
        
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: GestureDetector(
                onTap: () {
                    context.read<MovieBloc>().add(FilterMoviesByGenre(genre.id));
                  
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Color(0xFF2c2c3c),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      genre.name,
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
       } );
      },
    );
  }
}