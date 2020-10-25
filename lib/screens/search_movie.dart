import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/models/search_results.dart';
import 'package:movies_app/widgets/poster_image.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SearchMovie extends StatefulWidget {
  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  String searchText = "";
  SearchResult _searchResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: new Color.fromRGBO(27, 33, 47, 1),
      appBar: AppBar(
        title: Text(
          "Search",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.w700, fontSize: 28),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: TextFormField(
                style: TextStyle(fontSize: 20, color: Colors.white),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    iconSize: 28,
                    onPressed: () async {
                      SearchResult _result =
                          await API().searchMovie(searchText);
                      setState(() {
                        _searchResult = _result;
                      });
                    },
                  ),
                  suffixIconConstraints:
                      BoxConstraints(minHeight: 5, minWidth: 35),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  hintText: "Search Movies",
                  hintStyle: TextStyle(fontSize: 20, color: Colors.white30),
                  filled: true,
                  fillColor: const Color(0xFF273347),
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                      gapPadding: 2),
                ),
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
            ),
            if (_searchResult == null)
              Container(
                height: 200,
                color: Colors.red,
              )
            else
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _searchResult.movieList.length,
                  // ignore: missing_return
                  itemBuilder: (_, index) {
                    try {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: PosterImage(
                                    posterPath: _searchResult
                                            .movieList[index].posterPath ??
                                        null),
                              ),
                            ),
                            Flexible(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _searchResult.movieList[index].title ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "Rating: " +
                                                      _searchResult
                                                          .movieList[index]
                                                          .voteAverage
                                                          .toString() ??
                                                  0,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            SmoothStarRating(
                                              color: Colors.yellow,
                                              borderColor: Colors.yellow,
                                              isReadOnly: true,
                                              size: 20,
                                              spacing: -1,
                                              rating: _searchResult
                                                      .movieList[index]
                                                      .voteAverage ??
                                                  0,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Release Date: " +
                                            _searchResult
                                                .movieList[index].releaseDate,
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      );
                    } catch (ex) {
                      print(ex.toString());
                    }
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
