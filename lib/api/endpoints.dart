import 'package:http/http.dart' as http;
import 'api_key.dart';

class EndPoints {
  String baseURL = "https://api.themoviedb.org/3";

  Future<http.Response> searchMovie(String movieName) {
    String url = baseURL +
        "/search/movie?api_key=" +
        APIKEY().key +
        "&language=en-US&include_adult=false&page=1&";
    var response = http.get(url + "query=" + movieName);
    print(response);
    return response;
  }

  Future<http.Response> trendingMovies() {
    String url = baseURL + "/trending/movie/week?api_key=" + APIKEY().key;
    var response = http.get(url);
    print(response);
    return response;
  }

  Future<http.Response> getKeywordMovies(String keyword) {
    String url =
        baseURL + "/movie/$keyword?api_key=" + APIKEY().key + "&language=en-US";
    var response = http.get(url);
    print(response);
    return response;
  }

  Future<http.Response> getMovieDetails(int movieID) {
    String url =
        baseURL + "/movie/$movieID?api_key=" + APIKEY().key + "&language=en-US";
    var response = http.get(url);
    print(response);
    return response;
  }

  Future<http.Response> getMovieCredits(int movieID) {
    String url = baseURL + "/movie/$movieID/credits?api_key=" + APIKEY().key;
    var response = http.get(url);
    print(response);
    return response;
  }
}
