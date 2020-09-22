class Movie {
  String title;
  String releaseDate;
  String id;
  String avgVote;
  String posterPath;
  String overView;

  Movie.initialValue()
      : title = "",
        releaseDate = "",
        id = "",
        avgVote = "",
        posterPath = "",
        overView = "";

  Movie.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        releaseDate = json["release_date"],
        id = json["id"].toString(),
        avgVote = json["vote_average"].toString(),
        posterPath = json["poster_path"],
        overView = json["overview"];

  @override
  String toString() {
    return 'Movie Title: $title, id: $id';
  }
}
