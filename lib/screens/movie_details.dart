import 'package:flutter/material.dart';
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
      body: Column(children: [
        FutureBuilder(
            future: API().getMovieDetails(widget.movieID),
            builder: (_, AsyncSnapshot<MovieDetails> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = <Widget>[
                  Stack(children: [
                    _PosterImage(posterPath: snapshot.data.posterPath)
                  ])
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

class _PosterImage extends StatelessWidget {
  const _PosterImage({Key key, @required String posterPath})
      : _posterPath = posterPath,
        super(key: key);

  final String _posterPath;

  @override
  Widget build(BuildContext context) {
    return Image.network(ApiImageConfiguration().baseURL + "w342" + _posterPath,
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
