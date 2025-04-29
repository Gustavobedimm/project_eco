import 'package:flutter/material.dart';
import 'package:project_eco/viewmodels/movie_viewmodel.dart';
import 'package:project_eco/widgets/genre_filter.dart';
import 'package:project_eco/widgets/movie_list.dart';
import 'package:project_eco/widgets/movie_search.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<MovieViewModel>(context, listen: false).fetchMoviesPopular();
      Provider.of<MovieViewModel>(context, listen: false).fetchMoviesUpComing();
      Provider.of<MovieViewModel>(context, listen: false).fetchMoviesNow();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModelMovie = Provider.of<MovieViewModel>(context);

    return Scaffold(
      backgroundColor: Color(0xFF1f1f2b),
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1f2b),
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SearchMovie(),
          SizedBox(height: 16),
          GenreFilter(),
          SizedBox(height: 16),
          SizedBox(
            height: 290,
            child: MovieList(
              title: 'Os mais populares',
              movies: viewModelMovie.moviesPopular,
            ),
          ),
          SizedBox(
            height: 290,
            child: MovieList(
              title: 'Agora nos cinemas',
              movies: viewModelMovie.moviesNow,
            ),
          ),
          SizedBox(
            height: 290,
            child: MovieList(
              title: 'Em breve nos cinemas',
              movies: viewModelMovie.moviesUpComing,
            ),
          ),
          
        ],
        
      ),
    );
  }
}
