import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/models/movie_credits.dart';

class CrewAndCast extends StatelessWidget {
  final int movieID;

  const CrewAndCast({this.movieID});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: API().getCrewAndCast(movieID),
        builder: (_, AsyncSnapshot<MovieCredits> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[Container(height: 500)];
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
