import 'package:movies_app/api/endpoints.dart';
import 'package:movies_app/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  Future<SearchResult> searchMovie(String movieName) async {
    var response = await EndPoints().searchMovie(movieName);
    //if OK response and data retrieved
    if (response.statusCode == 200) {
      return SearchResult.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      return null;
    }
  }
}
