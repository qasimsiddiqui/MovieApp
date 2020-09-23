import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/models/search_results.dart';
import 'package:movies_app/widgets/movie_details_carousel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SearchResult _result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromRGBO(33, 36, 41, 1),
        child: Column(
          children: [
            _result != null
                ? MovieDetailsCarousel(_result)
                : CircularProgressIndicator(),
            RaisedButton(
                child: Text('get movies'),
                onPressed: () async {
                  SearchResult result = await API().trendingMovies();
                  print(result);
                  setState(() {
                    _result = result;
                  });
                })
          ],
        ),
      ),
    );
  }
}
