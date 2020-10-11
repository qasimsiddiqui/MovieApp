import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/models/movie_details.dart';
import 'package:movies_app/widgets/backdrop_image.dart';
import 'package:movies_app/widgets/crew_and_cast.dart';
import 'package:movies_app/widgets/poster_image.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieID;

  const MovieDetailsScreen({this.movieID});

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  String _getGenreNames(List<Genres> genreList) {
    String list = "";
    for (var genre in genreList) {
      list += genre.name;
      if (genre != genreList.last) list += ", ";
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: new Color.fromRGBO(27, 33, 47, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
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
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.3,
                          ),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
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
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
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
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
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
                                                fontSize: 13,
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
                                                fontSize: 13,
                                                color: Colors.white60))
                                      ]))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Snopsis:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.white70)),
                                Text(snapshot.data.overview,
                                    maxLines: 9,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white)),
                                SizedBox(height: 20),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "Genres: ",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white70)),
                                  TextSpan(
                                      text:
                                          _getGenreNames(snapshot.data.genres),
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                ]))
                              ],
                            ),
                          ),
                          CrewAndCast(movieID: snapshot.data.id)
                        ],
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
      ),
    );
  }
}
