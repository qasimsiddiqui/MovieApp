import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/models/search_results.dart';
import 'package:movies_app/widgets/poster_image.dart';

class ActionMoviesGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: API().trendingMovies(),
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
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
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
                  height: 150,
                  child: ListView.builder(
                    itemExtent: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return GridTile(
                        child: PosterImage(
                            result: snapshot.data, itemIndex: index),
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