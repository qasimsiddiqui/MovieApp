class MovieDetails {
  bool _adult;
  String _backdropPath;
  // Null _belongsToCollection;
  int _budget;
  List<Genres> _genres;
  String _homepage;
  int _id;
  String _imdbId;
  String _originalLanguage;
  String _originalTitle;
  String _overview;
  double _popularity;
  String _posterPath;
  List<ProductionCompanies> _productionCompanies;
  // List<ProductionCountries> _productionCountries;
  String _releaseDate;
  int _revenue;
  int _runtime;
  // List<SpokenLanguages> _spokenLanguages;
  String _status;
  String _tagline;
  String _title;
  bool _video;
  double _voteAverage;
  int _voteCount;

  MovieDetails(
      {bool adult,
      String backdropPath,
      Null belongsToCollection,
      int budget,
      List<Genres> genres,
      String homepage,
      int id,
      String imdbId,
      String originalLanguage,
      String originalTitle,
      String overview,
      double popularity,
      String posterPath,
      List<ProductionCompanies> productionCompanies,
      // List<ProductionCountries> productionCountries,
      String releaseDate,
      int revenue,
      int runtime,
      // List<SpokenLanguages> spokenLanguages,
      String status,
      String tagline,
      String title,
      bool video,
      double voteAverage,
      int voteCount}) {
    this._adult = adult;
    this._backdropPath = backdropPath;
    // this._belongsToCollection = belongsToCollection;
    this._budget = budget;
    this._genres = genres;
    this._homepage = homepage;
    this._id = id;
    this._imdbId = imdbId;
    this._originalLanguage = originalLanguage;
    this._originalTitle = originalTitle;
    this._overview = overview;
    this._popularity = popularity;
    this._posterPath = posterPath;
    this._productionCompanies = productionCompanies;
    // this._productionCountries = productionCountries;
    this._releaseDate = releaseDate;
    this._revenue = revenue;
    this._runtime = runtime;
    // this._spokenLanguages = spokenLanguages;
    this._status = status;
    this._tagline = tagline;
    this._title = title;
    this._video = video;
    this._voteAverage = voteAverage;
    this._voteCount = voteCount;
  }

  bool get adult => _adult;
  String get backdropPath => _backdropPath;
  // Null get belongsToCollection => _belongsToCollection;
  int get budget => _budget;
  List<Genres> get genres => _genres;
  String get homepage => _homepage;
  int get id => _id;
  String get imdbId => _imdbId;
  String get originalLanguage => _originalLanguage;
  String get originalTitle => _originalTitle;
  String get overview => _overview;
  double get popularity => _popularity;
  String get posterPath => _posterPath;
  List<ProductionCompanies> get productionCompanies => _productionCompanies;
  // List<ProductionCountries> get productionCountries => _productionCountries;
  String get releaseDate => _releaseDate;
  int get revenue => _revenue;
  int get runtime => _runtime;
  // List<SpokenLanguages> get spokenLanguages => _spokenLanguages;
  String get status => _status;
  String get tagline => _tagline;
  String get title => _title;
  bool get video => _video;
  double get voteAverage => _voteAverage;
  int get voteCount => _voteCount;

  MovieDetails.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    // _belongsToCollection = json['belongs_to_collection'];
    _budget = json['budget'];
    if (json['genres'] != null) {
      _genres = new List<Genres>();
      json['genres'].forEach((v) {
        _genres.add(new Genres.fromJson(v));
      });
    }
    _homepage = json['homepage'];
    _id = json['id'];
    _imdbId = json['imdb_id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      _productionCompanies = new List<ProductionCompanies>();
      json['production_companies'].forEach((v) {
        _productionCompanies.add(new ProductionCompanies.fromJson(v));
      });
    }
    // if (json['production_countries'] != null) {
    //   _productionCountries = new List<ProductionCountries>();
    //   json['production_countries'].forEach((v) {
    //     _productionCountries.add(new ProductionCountries.fromJson(v));
    //   });
    // }
    _releaseDate = json['release_date'];
    _revenue = json['revenue'];
    _runtime = json['runtime'];
    // if (json['spoken_languages'] != null) {
    //   _spokenLanguages = new List<SpokenLanguages>();
    //   json['spoken_languages'].forEach((v) {
    //     _spokenLanguages.add(new SpokenLanguages.fromJson(v));
    //   });
    // }
    _status = json['status'];
    _tagline = json['tagline'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this._adult;
    data['backdrop_path'] = this._backdropPath;
    // data['belongs_to_collection'] = this._belongsToCollection;
    data['budget'] = this._budget;
    if (this._genres != null) {
      data['genres'] = this._genres.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this._homepage;
    data['id'] = this._id;
    data['imdb_id'] = this._imdbId;
    data['original_language'] = this._originalLanguage;
    data['original_title'] = this._originalTitle;
    data['overview'] = this._overview;
    data['popularity'] = this._popularity;
    data['poster_path'] = this._posterPath;
    if (this._productionCompanies != null) {
      data['production_companies'] =
          this._productionCompanies.map((v) => v.toJson()).toList();
    }
    // if (this._productionCountries != null) {
    //   data['production_countries'] =
    //       this._productionCountries.map((v) => v.toJson()).toList();
    // }
    data['release_date'] = this._releaseDate;
    data['revenue'] = this._revenue;
    data['runtime'] = this._runtime;
    // if (this._spokenLanguages != null) {
    //   data['spoken_languages'] =
    //       this._spokenLanguages.map((v) => v.toJson()).toList();
    // }
    data['status'] = this._status;
    data['tagline'] = this._tagline;
    data['title'] = this._title;
    data['video'] = this._video;
    data['vote_average'] = this._voteAverage;
    data['vote_count'] = this._voteCount;
    return data;
  }
}

class Genres {
  int _id;
  String _name;

  Genres({int id, String name}) {
    this._id = id;
    this._name = name;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  Genres.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}

class ProductionCompanies {
  int _id;
  String _logoPath;
  String _name;
  String _originCountry;

  ProductionCompanies(
      {int id, String logoPath, String name, String originCountry}) {
    this._id = id;
    this._logoPath = logoPath;
    this._name = name;
    this._originCountry = originCountry;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get logoPath => _logoPath;
  set logoPath(String logoPath) => _logoPath = logoPath;
  String get name => _name;
  set name(String name) => _name = name;
  String get originCountry => _originCountry;
  set originCountry(String originCountry) => _originCountry = originCountry;

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _logoPath = json['logo_path'];
    _name = json['name'];
    _originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['logo_path'] = this._logoPath;
    data['name'] = this._name;
    data['origin_country'] = this._originCountry;
    return data;
  }
}

// class ProductionCountries {
//   String _iso31661;
//   String _name;

//   ProductionCountries({String iso31661, String name}) {
//     this._iso31661 = iso31661;
//     this._name = name;
//   }

//   String get iso31661 => _iso31661;
//   set iso31661(String iso31661) => _iso31661 = iso31661;
//   String get name => _name;
//   set name(String name) => _name = name;

//   ProductionCountries.fromJson(Map<String, dynamic> json) {
//     _iso31661 = json['iso_3166_1'];
//     _name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['iso_3166_1'] = this._iso31661;
//     data['name'] = this._name;
//     return data;
//   }
// }

// class SpokenLanguages {
//   String _iso6391;
//   String _name;

//   SpokenLanguages({String iso6391, String name}) {
//     this._iso6391 = iso6391;
//     this._name = name;
//   }

//   String get iso6391 => _iso6391;
//   set iso6391(String iso6391) => _iso6391 = iso6391;
//   String get name => _name;
//   set name(String name) => _name = name;

//   SpokenLanguages.fromJson(Map<String, dynamic> json) {
//     _iso6391 = json['iso_639_1'];
//     _name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['iso_639_1'] = this._iso6391;
//     data['name'] = this._name;
//     return data;
//   }
// }
