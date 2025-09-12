class Movies {
  final List<Movie> moviesResults;
  
  Movies({required this.moviesResults});

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      moviesResults: List<Movie>.from(
        (json['results'] ?? []).map(
              (e) => Movie.fromJson(e),
        ),
      ),
    );
  }

}
class Movie {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String? releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    // helper to parse numbers that might come as int, double or string
    // we have to account for whatsoever types the json objects are returned as.
    double toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      return double.tryParse('$v') ?? 0.0;
    }

    int toInt(dynamic v) {
      if (v == null) return 0;
      if (v is int) return v;
      return int.tryParse('$v') ?? 0;
    }

    return Movie(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path']?.toString(), // nullable vars don't have to be handled with null safety
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      id: toInt(json['id']),
      originalLanguage: json['original_language']?.toString() ?? '',
      originalTitle: json['original_title']?.toString() ?? '',
      overview: json['overview']?.toString() ?? '',
      popularity: toDouble(json['popularity']),
      posterPath: json['poster_path']?.toString(),
      releaseDate: json['release_date']?.toString(),
      title: json['title']?.toString() ?? '',
      video: json['video'] ?? false,
      voteAverage: toDouble(json['vote_average']),
      voteCount: toInt(json['vote_count']),
    );
  }

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'genre_ids': genreIds,
    'id': id,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'release_date': releaseDate,
    'title': title,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };

  Movie copy({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return Movie(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }
}
//
// Breakdown:
// json['results'] ?? [] → if "results" is missing or null, we use an empty list.
// .map((e) => Movie.fromJson(e)) → maps each Map<String, dynamic> into a Movie.
// List<Movie>.from(...) → collects that mapped list into a List<Movie> while enforcing type safety.