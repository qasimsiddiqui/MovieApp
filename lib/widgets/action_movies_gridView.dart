import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/models/search_results.dart';
import 'package:movies_app/widgets/poster_image.dart';

class ActionMoviesGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: API().actionMovies(),
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
                          'Action Movies',
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
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: PosterImage(
                            posterPath:
                                snapshot.data.movieList[index].posterPath,
                          ),
                        ),
                      );
                    },
                  ))
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
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
