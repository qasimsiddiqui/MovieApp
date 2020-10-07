import 'package:flutter/material.dart';
import 'package:movies_app/api/api_configuration.dart';
import 'package:movies_app/models/search_results.dart';

class PosterImage extends StatelessWidget {
  const PosterImage({Key key, @required String posterPath})
      : _posterPath = posterPath,
        super(key: key);

  final String _posterPath;
  @override
  Widget build(BuildContext context) {
    return Image.network(ApiImageConfiguration().baseURL + "w342" + _posterPath,
        //width: MediaQuery.of(context).size.width * 0.8,
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
