import 'package:flutter/material.dart';
import 'package:project_eco/viewmodels/genre_viewmodel.dart';
import 'package:project_eco/viewmodels/movie_viewmodel.dart';
import 'package:provider/provider.dart';

class GenreFilter extends StatefulWidget {
  const GenreFilter({super.key});

  @override
  State<GenreFilter> createState() => _GenreFilterState();
}

class _GenreFilterState extends State<GenreFilter> {
  int selectedGenre = 0;
  
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
    Provider.of<GenreViewmodel>(context, listen: false).fetchGenres();
    });
  }
  @override
  Widget build(BuildContext context) {
    final viewModelGenre = Provider.of<GenreViewmodel>(context);
    final viewModelMovie = Provider.of<MovieViewModel>(context);
    

    return SizedBox(
      height: 50, // altura do badge
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: viewModelGenre.listGenre.length,
        itemBuilder: (context, index) {
          final genre = viewModelGenre.listGenre[index];
          final isSelected = genre.id == selectedGenre;
      
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedGenre = genre.id;
                  viewModelMovie.filterMoviesByGenre(genre.id);
                });
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
  }
}