import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_eco/blocs/genre/genre_bloc.dart';
import 'package:project_eco/blocs/genre/genre_event.dart';
import 'package:project_eco/blocs/movie/movie_bloc.dart';
import 'package:project_eco/blocs/movie/movie_event.dart';
import 'package:project_eco/services/genre_service.dart';
import 'package:project_eco/services/movie_service.dart';
//import 'package:project_eco/viewmodels/genre_viewmodel.dart';
//import 'package:project_eco/viewmodels/movie_viewmodel.dart';
//import 'package:project_eco/views/home_view.dart';
import 'package:project_eco/views/home_view_bloc.dart';
//import 'package:provider/provider.dart';


void main() {
  final genreService = GenreService();
  final movieService = MovieService();
  runApp(
    //MultiProvider(
    //  providers: [
        //ChangeNotifierProvider(create: (_) =>  MovieViewModel()),
        //ChangeNotifierProvider(create: (_) =>  GenreViewmodel()),
     // ],
     // child: MyApp(),
   // ),
   MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GenreBloc(genreService)..add(FetchGenres())),
        BlocProvider(create: (_) => MovieBloc(movieService)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GBM Ecocentauro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1f1f2b)),

      ),
      home: BlocProvider(
        create: (_) => MovieBloc(MovieService())
          ..add(FetchPopularMovies())
          ..add(FetchUpcomingMovies())
          ..add(FetchNowMovies()),
        child: const MyHomePageBloc(title: 'Início'),
      ),
    );
  }
}

