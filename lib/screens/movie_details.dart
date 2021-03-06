import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/models/movie_details.dart';
import 'package:movies_app/widgets/backdrop_image.dart';
import 'package:movies_app/widgets/cast_listView.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
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
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  color: Colors.white.withOpacity(0.15),
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => Navigator.pop(context)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.25,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.28,
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
                                        Text(snapshot.data.title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6),
                                        SizedBox(height: 5),
                                        Text.rich(TextSpan(children: [
                                          TextSpan(
                                              text: "(" +
                                                  snapshot.data.releaseDate
                                                      .substring(0, 4) +
                                                  ")",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1),
                                          TextSpan(
                                              text: "  |  " +
                                                  (snapshot.data.runtime ~/ 60)
                                                      .toString() +
                                                  "hr " +
                                                  (snapshot.data.runtime % 60)
                                                      .toString() +
                                                  "min",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1)
                                        ]))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 10, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Snopsis:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                  Text(snapshot.data.overview,
                                      maxLines: 9,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                  SizedBox(height: 20),
                                  Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: "Genres: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    TextSpan(
                                        text: _getGenreNames(
                                            snapshot.data.genres),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ]))
                                ],
                              ),
                            ),
                            CastListView(movieID: snapshot.data.id)
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
      ),
    );
  }
}
