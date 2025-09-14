class SearchResults {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? originalTitle; // Added this field
  String? overview;
  double? popularity;
  String? posterPath;
  String? firstAirDate;
  String? releaseDate; // Added this field
  String? name;
  String? title; // Added this field
  double? voteAverage;
  int? voteCount;
  bool? video; // Added this field

  SearchResults({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.releaseDate,
    this.name,
    this.title,
    this.voteAverage,
    this.voteCount,
    this.video,
  });

  factory SearchResults.fromJson(Map<String, dynamic> json) {
    return SearchResults(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: json['genre_ids'] != null
          ? List<int>.from(json['genre_ids'].map((x) => x as int))
          : null,
      id: json['id'] as int?,
      originCountry: json['origin_country'] != null
          ? List<String>.from(json['origin_country'].map((x) => x as String))
          : null,
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      firstAirDate: json['first_air_date'] as String?,
      releaseDate: json['release_date'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      video: json['video'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_name': originalName,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'first_air_date': firstAirDate,
      'release_date': releaseDate,
      'name': name,
      'title': title,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'video': video,
    };
  }
}