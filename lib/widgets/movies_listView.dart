import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/models/search_results.dart';
import 'package:movies_app/screens/movie_details.dart';
import 'package:movies_app/widgets/poster_image.dart';

class MoviesListView extends StatelessWidget {
  final String searchWord;
  final Map<String, String> names = {
    "top_rated": "Top Rated",
    "popular": "Popular",
    "upcoming": "Upcoming"
  };

  MoviesListView({this.searchWord});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: API().getKeywordMovies(searchWord),
        builder: (_, AsyncSnapshot<SearchResult> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          names[searchWord],
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue),
                        )
                      ])),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.movieList.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => MovieDetailsScreen(
                                    movieID:
                                        snapshot.data.movieList[index].id))),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: PosterImage(
                              posterPath:
                                  snapshot.data.movieList[index].posterPath,
                            ),
                          ),
                        ),
                      );
                    },
                  ))
            ];
          } else if (snapshot.hasError || snapshot.data == null) {
            children = <Widget>[];
            print("No internet error.");
          } else {
            children = <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        });
  }
}
