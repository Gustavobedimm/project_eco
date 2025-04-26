import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;

  const MovieDetail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f1f2b),

      appBar: AppBar(
        title: Text(movie.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              movie.imgPath.isNotEmpty
                  ? Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.imgPath}',
                    fit: BoxFit.cover,
                  )
                  : Container(height: 200, color: Colors.grey),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(width: 4), // espaçamento entre ícone e texto
                        Text(
                          "${movie.voteAverage.toStringAsFixed(1)} / 10",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Descrição',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                movie.overview,
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
