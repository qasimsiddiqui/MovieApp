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
}
