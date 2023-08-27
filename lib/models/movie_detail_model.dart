class MovieDetailModel {
  late String title, overview;
  late num voteAverage;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        voteAverage = json['vote_average'],
        overview = json['overview'];
}
