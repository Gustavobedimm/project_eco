
class Movie {
  
  final String title;
  final String imgPath;
  final double voteAverage;
  final int voteCount;
  final String overview;
  final List<int> genreIds;

  Movie({required this.title, required this.imgPath, required this.voteAverage, required this.voteCount, required this.overview, required this.genreIds});

factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      imgPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      overview: json['overview'],
      genreIds: List<int>.from(json['genre_ids'] ?? []),

    );
  }
}