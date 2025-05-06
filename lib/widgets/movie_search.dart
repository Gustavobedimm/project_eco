import 'package:flutter/material.dart';
//import 'package:project_eco/viewmodels/movie_viewmodel.dart';
//import 'package:provider/provider.dart';

class SearchMovie extends StatefulWidget {
  const SearchMovie({super.key});

  @override
  State<SearchMovie> createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  //TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final viewModelMovie = Provider.of<MovieViewModel>(context);

    return Column(
      children: [
        TextField(
          style: TextStyle(color: Colors.white),

          //controller: _searchController,
          decoration: InputDecoration(
            labelText: 'Buscar filme',
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
          onChanged: null//viewModelMovie.filterMoviesText,
        ),
      ],
    );
  }
}
