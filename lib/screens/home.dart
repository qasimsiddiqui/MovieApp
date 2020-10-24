import 'package:flutter/material.dart';
import 'package:movies_app/widgets/movies_listView.dart';
import 'package:movies_app/widgets/trendingMovies_carousel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: new Color.fromRGBO(27, 33, 47, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Movies App',
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            icon: Icon(
              Icons.search,
              size: 35,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TrendingMoviesCarousel(),
            MoviesListView(searchWord: "popular"),
            MoviesListView(searchWord: "top_rated"),
            MoviesListView(searchWord: "upcoming")
          ],
        ),
      ),
    );
  }
}
