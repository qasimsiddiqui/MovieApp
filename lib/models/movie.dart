class Movie {
  int _id;
  bool _video;
  int _voteCount;
  double _voteAverage;
  String _title;
  String _releaseDate;
  String _originalLanguage;
  String _originalTitle;
  //List<int> _genreIds;
  String _backdropPath;
  bool _adult;
  String _overview;
  String _posterPath;
  double _popularity;
  String _mediaType;
  String _originalName;
  String _name;
  String _firstAirDate;
  //List<String> _originCountry;

  Movie({
    int id,
    bool video,
    int voteCount,
    double voteAverage,
    String title,
    String releaseDate,
    String originalLanguage,
    String originalTitle,
    //List<int> genreIds,
    String backdropPath,
    bool adult,
    String overview,
    String posterPath,
    double popularity,
    String mediaType,
    String originalName,
    String name,
    String firstAirDate,
    //List<String> originCountry
  }) {
    this._id = id;
    this._video = video;
    this._voteCount = voteCount;
    this._voteAverage = voteAverage;
    this._title = title;
    this._releaseDate = releaseDate;
    this._originalLanguage = originalLanguage;
    this._originalTitle = originalTitle;
    //this._genreIds = genreIds;
    this._backdropPath = backdropPath;
    this._adult = adult;
    this._overview = overview;
    this._posterPath = posterPath;
    this._popularity = popularity;
    this._mediaType = mediaType;
    this._originalName = originalName;
    this._name = name;
    this._firstAirDate = firstAirDate;
    //this._originCountry = originCountry;
  }

  int get id => _id;
  bool get video => _video;
  int get voteCount => _voteCount;
  double get voteAverage => _voteAverage;
  String get title => _title;
  String get releaseDate => _releaseDate;
  String get originalLanguage => _originalLanguage;
  String get originalTitle => _originalTitle;
  //List<int> get genreIds => _genreIds;
  String get backdropPath => _backdropPath;
  bool get adult => _adult;
  String get overview => _overview;
  String get posterPath => _posterPath;
  double get popularity => _popularity;
  String get mediaType => _mediaType;
  String get originalName => _originalName;
  String get name => _name;
  String get firstAirDate => _firstAirDate;
  //List<String> get originCountry => _originCountry;

  Movie.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _video = json['video'];
    _voteCount = json['vote_count'];
    _voteAverage = json['vote_average'].toDouble();
    _title = json['title'];
    _releaseDate = json['release_date'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    // _genreIds = json['genre_ids'].cast<int>() ?? [];
    _backdropPath = json['backdrop_path'];
    _adult = json['adult'];
    _overview = json['overview'];
    _posterPath = json['poster_path'];
    _popularity = json['popularity'];
    _mediaType = json['media_type'];
    _originalName = json['original_name'];
    _name = json['name'];
    _firstAirDate = json['first_air_date'];
    //_originCountry = json['origin_country'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['video'] = this._video;
    data['vote_count'] = this._voteCount;
    data['vote_average'] = this._voteAverage;
    data['title'] = this._title;
    data['release_date'] = this._releaseDate;
    data['original_language'] = this._originalLanguage;
    data['original_title'] = this._originalTitle;
    //data['genre_ids'] = this._genreIds;
    data['backdrop_path'] = this._backdropPath;
    data['adult'] = this._adult;
    data['overview'] = this._overview;
    data['poster_path'] = this._posterPath;
    data['popularity'] = this._popularity;
    data['media_type'] = this._mediaType;
    data['original_name'] = this._originalName;
    data['name'] = this._name;
    data['first_air_date'] = this._firstAirDate;
    //data['origin_country'] = this._originCountry;
    return data;
  }

  @override
  String toString() {
    return 'Movie Title: $title, id: $id';
  }
}
