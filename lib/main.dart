import 'package:flutter/material.dart';
import 'package:project_eco/viewmodels/genre_viewmodel.dart';
import 'package:project_eco/viewmodels/movie_viewmodel.dart';
import 'package:project_eco/views/home_view.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>  MovieViewModel()),
        ChangeNotifierProvider(create: (_) =>  GenreViewmodel()),
      ],
      child: MyApp(),
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
      home: const MyHomePage(title: 'Home'),
    );
  }
}

