class MovieCredits {
  int _id;
  List<Cast> _cast;
  List<Crew> _crew;

  MovieCredits({int id, List<Cast> cast, List<Crew> crew}) {
    this._id = id;
    this._cast = cast;
    this._crew = crew;
  }

  int get id => _id;
  List<Cast> get cast => _cast;
  List<Crew> get crew => _crew;

  MovieCredits.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    if (json['cast'] != null) {
      _cast = new List<Cast>();
      json['cast'].forEach((v) {
        _cast.add(new Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      _crew = new List<Crew>();
      json['crew'].forEach((v) {
        _crew.add(new Crew.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._cast != null) {
      data['cast'] = this._cast.map((v) => v.toJson()).toList();
    }
    if (this._crew != null) {
      data['crew'] = this._crew.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cast {
  int _castId;
  String _character;
  String _creditId;
  int _gender;
  int _id;
  String _name;
  int _order;
  String _profilePath;

  Cast(
      {int castId,
      String character,
      String creditId,
      int gender,
      int id,
      String name,
      int order,
      String profilePath}) {
    this._castId = castId;
    this._character = character;
    this._creditId = creditId;
    this._gender = gender;
    this._id = id;
    this._name = name;
    this._order = order;
    this._profilePath = profilePath;
  }

  int get castId => _castId;
  String get character => _character;
  String get creditId => _creditId;
  int get gender => _gender;
  int get id => _id;
  String get name => _name;
  int get order => _order;
  String get profilePath => _profilePath;

  Cast.fromJson(Map<String, dynamic> json) {
    _castId = json['cast_id'];
    _character = json['character'];
    _creditId = json['credit_id'];
    _gender = json['gender'];
    _id = json['id'];
    _name = json['name'];
    _order = json['order'];
    _profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cast_id'] = this._castId;
    data['character'] = this._character;
    data['credit_id'] = this._creditId;
    data['gender'] = this._gender;
    data['id'] = this._id;
    data['name'] = this._name;
    data['order'] = this._order;
    data['profile_path'] = this._profilePath;
    return data;
  }
}

class Crew {
  String _creditId;
  String _department;
  int _gender;
  int _id;
  String _job;
  String _name;
  String _profilePath;

  Crew(
      {String creditId,
      String department,
      int gender,
      int id,
      String job,
      String name,
      String profilePath}) {
    this._creditId = creditId;
    this._department = department;
    this._gender = gender;
    this._id = id;
    this._job = job;
    this._name = name;
    this._profilePath = profilePath;
  }

  String get creditId => _creditId;
  String get department => _department;
  int get gender => _gender;
  int get id => _id;
  String get job => _job;
  String get name => _name;
  String get profilePath => _profilePath;

  Crew.fromJson(Map<String, dynamic> json) {
    _creditId = json['credit_id'];
    _department = json['department'];
    _gender = json['gender'];
    _id = json['id'];
    _job = json['job'];
    _name = json['name'];
    _profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credit_id'] = this._creditId;
    data['department'] = this._department;
    data['gender'] = this._gender;
    data['id'] = this._id;
    data['job'] = this._job;
    data['name'] = this._name;
    data['profile_path'] = this._profilePath;
    return data;
  }
}
