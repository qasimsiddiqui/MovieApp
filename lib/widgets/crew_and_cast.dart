import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/models/movie_credits.dart';
import 'package:movies_app/widgets/poster_image.dart';

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
            children = <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cast:',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      ])),
              Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.cast.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              height: 160,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: PosterImage(
                                  posterPath:
                                      snapshot.data.cast[index].profilePath,
                                ),
                              ),
                            ),
                            Text(snapshot.data.cast[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white))
                          ],
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
