import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/api/api_configuration.dart';
import 'package:movies_app/models/search_results.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MovieDetailsCarousel extends StatelessWidget {
  SearchResult _result;

  MovieDetailsCarousel(this._result);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: _result.movieList.length ?? 0,
      options: CarouselOptions(
        autoPlayAnimationDuration: Duration(seconds: 1),
        height: 218,
      ),
      itemBuilder: (BuildContext context, int itemIndex) => Card(
        color: Colors.white70,
        margin: EdgeInsets.all(4),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    ApiImageConfiguration().baseURL +
                        "w342" +
                        _result.movieList[itemIndex].posterPath,
                    loadingBuilder:
                        (_, Widget child, ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                      child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ));
                }),
              ),
            ),
            Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _result.movieList[itemIndex].title,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(_result.movieList[itemIndex].releaseDate
                          .substring(0, 4)),
                      SizedBox(
                        height: 2,
                      ),
                      SmoothStarRating(
                        isReadOnly: true,
                        color: Colors.yellow,
                        borderColor: Colors.yellow,
                        size: 22,
                        rating: _result.movieList[itemIndex].voteAverage / 2,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        _result.movieList[itemIndex].overview,
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}