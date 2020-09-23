import 'package:movies_app/models/movie.dart';

class SearchResult {
  int _page;
  List<Movie> _movieList;
  int _totalPages;
  int _totalResults;

  SearchResult(
      {int page, List<Movie> movieList, int totalPages, int totalResults}) {
    this._page = page;
    this._movieList = movieList;
    this._totalPages = totalPages;
    this._totalResults = totalResults;
  }

  int get page => _page;
  List<Movie> get movieList => _movieList;
  int get totalPages => _totalPages;
  int get totalResults => _totalResults;

  SearchResult.fromJson(Map<String, dynamic> json) {
    _page = json['page'];
    if (json['results'] != null) {
      _movieList = new List<Movie>();
      json['results'].forEach((v) {
        _movieList.add(new Movie.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this._page;
    if (this._movieList != null) {
      data['results'] = this._movieList.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this._totalPages;
    data['total_results'] = this._totalResults;
    return data;
  }
}
