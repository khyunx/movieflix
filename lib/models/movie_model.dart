class MovieModel {
  final int id;
  final String posterPath, title;

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        posterPath = "https://image.tmdb.org/t/p/w500/${json['poster_path']}";
}
