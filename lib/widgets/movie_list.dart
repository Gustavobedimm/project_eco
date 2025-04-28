import 'package:flutter/material.dart';
import 'package:project_eco/models/movie.dart';
import 'package:project_eco/views/movie_detail.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  final String title;

  const MovieList({Key? key, required this.movies, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    if (movies.isEmpty) {
      return Column(
      children: [
        Row(
          children: [
            Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  
                ),
              ),
          ],
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 240,
          child: Center(child: Text("Nenhum filme encontrado." , style: TextStyle(color: Colors.white),),),
        ),
      ]);
    }
    return Column(
      children: [
        Row(
          children: [
            Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  
                ),
              ),
          ],
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => MovieDetail(movie: movie)),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      movie.imgPath.isNotEmpty
                          ? Image.network(
                            'https://image.tmdb.org/t/p/w200${movie.imgPath}',
                            width: 125,
                            fit: BoxFit.cover,
                          )
                          : Container(width: 125, color: Colors.grey),
                      SizedBox(height: 8),
                      SizedBox(
                        width: 125,
                        child: Text(
                          movie.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
