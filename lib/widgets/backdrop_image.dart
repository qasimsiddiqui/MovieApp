import 'package:flutter/material.dart';
import 'package:movies_app/api/api_configuration.dart';

class BackdropImage extends StatelessWidget {
  const BackdropImage({Key key, @required String posterPath})
      : _posterPath = posterPath,
        super(key: key);

  final String _posterPath;
  @override
  Widget build(BuildContext context) {
    return _posterPath == null
        ? Image.asset(
            'assets/images/noImage.jpg',
            fit: BoxFit.fitHeight,
          )
        : Image.network(ApiImageConfiguration().baseURL + "w780" + _posterPath,
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
