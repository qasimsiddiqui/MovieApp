import 'package:movies_app/models/movie.dart';

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
