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
}

class SearchResult {
  List movieList;
  int pageNo;
  int totalPages;
  int totalResults;

  SearchResult.fromJson(Map<String, dynamic> json)
      : totalResults = json["total_results"],
        totalPages = json["total_pages"],
        pageNo = json["page"],
        movieList = json["results"].map((movie) {
          return Movie.fromJson(movie);
        }).toList();

  @override
  String toString() {
    return """Search Result: \n
        totalPages: $totalPages \t totalResults: $totalResults \t pageNo: $pageNo \n
        movieList: ${movieList.length}   
    """;
  }
}
