import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/api/api_configuration.dart';
import 'package:movies_app/models/movie_details.dart';

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
      appBar: AppBar(),
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
                            _NetworkImage(
                                posterPath: snapshot.data.backdropPath,
                                size: 1),
                            BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                              child: Container(
                                color: Colors.black.withOpacity(0.6),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height - 80,
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: _NetworkImage(
                                    posterPath: snapshot.data.posterPath,
                                    size: 130),
                              ),
                            )
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

class _NetworkImage extends StatelessWidget {
  const _NetworkImage({Key key, @required String posterPath, double size})
      : _posterPath = posterPath,
        _size = size,
        super(key: key);

  final String _posterPath;
  final double _size;

  @override
  Widget build(BuildContext context) {
    return Image.network(
        ApiImageConfiguration().baseURL +
            "${_size == 1.0 ? "w780" : "w342"}" +
            _posterPath,
        width: _size == 1.0 ? MediaQuery.of(context).size.width : _size,
        loadingBuilder: (_, Widget child, ImageChunkEvent loadingProgress) {
      if (loadingProgress == null) return child;
      return Center(
          child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes
            : null,
      ));
    });
  }
}
