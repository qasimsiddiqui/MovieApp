import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/models/movie_details.dart';
import 'package:movies_app/widgets/backdrop_image.dart';
import 'package:movies_app/widgets/poster_image.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieID;

  const MovieDetailsScreen({this.movieID});

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: new Color.fromRGBO(27, 33, 47, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        FutureBuilder(
            future: API().getMovieDetails(widget.movieID),
            builder: (_, AsyncSnapshot<MovieDetails> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = <Widget>[
                  Stack(
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            BackdropImage(
                                posterPath: snapshot.data.backdropPath),
                            BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                              child: Container(
                                color: Colors.black.withOpacity(0.6),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.width * 0.564,
                              ),
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.3,
                            ),
                            Row(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.28,
                                  padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: PosterImage(
                                      posterPath: snapshot.data.posterPath,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.14),
                                      Text(
                                        snapshot.data.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2,
                                            color: Colors.white),
                                      ),
                                      SizedBox(height: 5),
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: "(" +
                                                snapshot.data.releaseDate
                                                    .substring(0, 4) +
                                                ")",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white60)),
                                        TextSpan(
                                            text: "  |  " +
                                                (snapshot.data.runtime ~/ 60)
                                                    .toString() +
                                                "hr " +
                                                (snapshot.data.runtime % 60)
                                                    .toString() +
                                                "min",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white60))
                                      ]))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
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
            }),
      ]),
    );
  }
}
