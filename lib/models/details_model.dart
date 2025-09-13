class MovieDetails {
  final bool adult;
  final String? backdropPath;
  final BelongsToCollection? belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String? tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const MovieDetails({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  //why are we using factory constructor?
  //why we using => for multiline block? isn't it there for a one line?
  //which is better? using the casting (as ...) or using conditional logic (json[''] ?? ...)
  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
    adult: json['adult'] as bool,
    backdropPath: json['backdrop_path'],
    //------using fromJson of another class'------
    //json ['']? ClassName.fromJson(lmfrud a-pass a json var of type Map<String, dynamic>, e.g. json['esm l variable in the json file'])

    belongsToCollection: json['belongs_to_collection'] != null
        ? BelongsToCollection.fromJson(json['belongs_to_collection'])
        : null,


    budget: json['budget'] as int,
    //------using fromJson on a list _of another class type_ through a map function------
    //json [''] (? ...) or (as...) .map((e) =>...???...).toList()
    // ??? => ClassName.fromJson(lmfrud a-pass a json var of type Map<String, dynamic>, e.g. json['esm l variable in the json file'])
    // here however, we are sending the list item we are mapping across, which counts as a json var too, 34an hoa lessa in need of further extraction, which is why we are still in need of another fromJson function.
    genres: (json['genres'] as List<dynamic>)
        .map((e) => Genre.fromJson(e))
        .toList(),
    homepage: json['homepage'],
    id: json['id'] as int,
    imdbId: json['imdb_id'],
    //------using fromJson on a list _of a built-in dart type_ through a map function------
    //json [''] (? ...) or (as...) .map((e) =>...???...).toList()
    // ??? => the mapped across element inside the list just needs a type casting, no extra fromJsons needed unlike the one before.
    originCountry:
    (json['origin_country'] as List<dynamic>).map((e) => e as String).toList(),
    originalLanguage: json['original_language'],
    originalTitle: json['original_title'],
    overview: json['overview'],
    popularity: (json['popularity'] as num).toDouble(),
    posterPath: json['poster_path'],
    productionCompanies: (json['production_companies'] as List<dynamic>)
        .map((e) => ProductionCompany.fromJson(e))
        .toList(),
    productionCountries: (json['production_countries'] as List<dynamic>)
        .map((e) => ProductionCountry.fromJson(e))
        .toList(),
    releaseDate: json['release_date'],
    revenue: json['revenue'] as int,
    runtime: json['runtime'] as int,
    spokenLanguages: (json['spoken_languages'] as List<dynamic>)
        .map((e) => SpokenLanguage.fromJson(e))
        .toList(),
    status: json['status'],
    tagline: json['tagline'],
    title: json['title'],
    video: json['video'] as bool,
    //why did we cast as a num then convert to double?
    voteAverage: (json['vote_average'] as num).toDouble(),
    voteCount: json['vote_count'] as int,
  );

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'belongs_to_collection': belongsToCollection?.toJson(),
    'budget': budget,
    'genres': genres.map((e) => e.toJson()).toList(),
    'homepage': homepage,
    'id': id,
    'imdb_id': imdbId,
    'origin_country': originCountry,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'production_companies': productionCompanies.map((e) => e.toJson()).toList(),
    'production_countries': productionCountries.map((e) => e.toJson()).toList(),
    'release_date': releaseDate,
    'revenue': revenue,
    'runtime': runtime,
    'spoken_languages': spokenLanguages.map((e) => e.toJson()).toList(),
    'status': status,
    'tagline': tagline,
    'title': title,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };
}

class BelongsToCollection {
  final int id;
  final String name;
  final String? posterPath;
  final String? backdropPath;

  const BelongsToCollection({
    required this.id,
    required this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      BelongsToCollection(
        id: json['id'] as int,
        name: json['name'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'poster_path': posterPath,
    'backdrop_path': backdropPath,
  };
}

class Genre {
  final int id;
  final String name;

  const Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json['id'] as int,
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}

class ProductionCompany {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  const ProductionCompany({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json['id'] as int,
        logoPath: json['logo_path'],
        name: json['name'],
        originCountry: json['origin_country'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'logo_path': logoPath,
    'name': name,
    'origin_country': originCountry,
  };
}

class ProductionCountry {
  final String iso31661;
  final String name;

  const ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      ProductionCountry(
        iso31661: json['iso_3166_1'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
    'iso_3166_1': iso31661,
    'name': name,
  };
}

class SpokenLanguage {
  final String englishName;
  final String iso6391;
  final String name;

  const SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
    englishName: json['english_name'],
    iso6391: json['iso_639_1'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'english_name': englishName,
    'iso_639_1': iso6391,
    'name': name,
  };
}
