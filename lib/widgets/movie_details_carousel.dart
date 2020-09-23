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
    return

        // CarouselSlider(
        //   options: CarouselOptions(
        //     height: 250,
        //     autoPlay: true,
        //     aspectRatio: 2.0,
        //     enlargeCenterPage: true,
        //   ),
        //   items: _result.movieList
        //       .map((item) => Container(
        //             child: Container(
        //               margin: EdgeInsets.all(5.0),
        //               child: ClipRRect(
        //                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //                   child: Stack(
        //                     children: <Widget>[
        //                       Image.network(
        //                           ApiImageConfiguration().baseURL +
        //                               "original" +
        //                               item.posterPath,
        //                           fit: BoxFit.cover,
        //                           width: 1000.0),
        //                       Positioned(
        //                         bottom: 0.0,
        //                         left: 0.0,
        //                         right: 0.0,
        //                         child: Container(
        //                           decoration: BoxDecoration(
        //                             gradient: LinearGradient(
        //                               colors: [
        //                                 Color.fromARGB(200, 0, 0, 0),
        //                                 Color.fromARGB(0, 0, 0, 0)
        //                               ],
        //                               begin: Alignment.bottomCenter,
        //                               end: Alignment.topCenter,
        //                             ),
        //                           ),
        //                           padding: EdgeInsets.symmetric(
        //                               vertical: 10.0, horizontal: 20.0),
        //                           child: Text(
        //                             '${item.title}',
        //                             style: TextStyle(
        //                               color: Colors.white,
        //                               fontSize: 20.0,
        //                               fontWeight: FontWeight.bold,
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   )),
        //             ),
        //           ))
        //       .toList(),
        // );

        CarouselSlider.builder(
      itemCount: _result.movieList.length ?? 0,
      options: CarouselOptions(
        autoPlayAnimationDuration: Duration(seconds: 1),
        height: 250,
      ),
      itemBuilder: (BuildContext context, int itemIndex) => Card(
        color: Colors.red,
        margin: EdgeInsets.all(5),
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
                child: Container(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          _result.movieList[itemIndex].title,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text(_result.movieList[itemIndex].releaseDate
                            .substring(0, 4)),
                        SmoothStarRating(
                          isReadOnly: true,
                          color: Colors.yellow,
                          borderColor: Colors.yellow,
                          size: 20,
                          rating: _result.movieList[itemIndex].voteAverage / 2,
                        ),
                        Text(
                          _result.movieList[itemIndex].overview,
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
