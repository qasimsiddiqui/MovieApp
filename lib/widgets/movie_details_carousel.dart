import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/api/api_configuration.dart';
import 'package:movies_app/models/search_results.dart';
import 'package:movies_app/screens/movie_details.dart';
import 'package:movies_app/widgets/poster_image.dart';

class TrendingMoviesCarousel extends StatefulWidget {
  @override
  _TrendingMoviesCarouselState createState() => _TrendingMoviesCarouselState();
}

class _TrendingMoviesCarouselState extends State<TrendingMoviesCarousel> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: API().trendingMovies(),
        builder: (_, AsyncSnapshot<SearchResult> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              CarouselSlider.builder(
                itemCount: snapshot.data.movieList.length ?? 0,
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    height: MediaQuery.of(context).size.height * 0.6,
                    viewportFraction: 0.7),
                itemBuilder: (BuildContext context, int itemIndex) => Card(
                  color: Colors.white70,
                  margin: EdgeInsets.all(4),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () => Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                                movieID:
                                    snapshot.data.movieList[itemIndex].id))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: PosterImage(
                        posterPath:
                            snapshot.data.movieList[itemIndex].posterPath,
                      ),
                    ),
                  ),
                ),
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
        });
  }
}
