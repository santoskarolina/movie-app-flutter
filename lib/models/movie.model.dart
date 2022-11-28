import 'dart:convert';

MoviesReponse modelFromJson(String data) =>
    MoviesReponse.fromJson(json.decode(data));

String modelToJson(MoviesReponse data) => json.encode(data.toJson());
Movie movieFromJson(String data) => Movie.fromJson2(json.decode(data));

class MoviesReponse {
  MoviesReponse({
    this.page,
    required this.results,
    this.total_pages,
    this.total_results,
  });

  int? page;
  List<Movie> results;
  int? total_pages;
  int? total_results;

  factory MoviesReponse.fromJson(Map<String, dynamic> json) => MoviesReponse(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        total_pages: json["total_pages"],
        total_results: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": total_pages,
        "total_results": total_results,
      };
}

class Movie {
  Movie({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.mediaType,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.name,
    this.runtime,
    this.originalName,
    this.genres,
    this.firstAirDate,
    this.originCountry,
  });

  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalTitle;
  String? overview;
  String? posterPath;
  List<int>? genreIds;
  double? popularity;
  DateTime? releaseDate;
  MediaType? mediaType;
  bool? video;
  double? voteAverage;
  int? voteCount;
  int? runtime;
  List<dynamic>? genres;
  String? name;
  String? originalName;
  DateTime? firstAirDate;
  List<String>? originCountry;

  // list all movies
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"].toDouble(),
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        name: json["name"],
        originalName: json["original_name"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        mediaType: mediaTypeValues.map[json["media_type"]],
      );

// list all movies
  factory Movie.fromJson2(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        genres: List<dynamic>.from(json["genres"]),
        popularity: json["popularity"].toDouble(),
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        name: json["name"],
        originalName: json["original_name"],
        runtime: json["runtime"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        mediaType: mediaTypeValues.map[json["media_type"]],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "name": name,
        "original_name": originalName,
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate?.year.toString().padLeft(4, '0')}-${firstAirDate?.month.toString().padLeft(2, '0')}-${firstAirDate?.day.toString().padLeft(2, '0')}",
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry!.map((x) => x)),
      };
}

enum MediaType { movie, tv }

final mediaTypeValues =
    EnumValues({"movie": MediaType.movie, "tv": MediaType.tv});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    return reverseMap;
  }
}
