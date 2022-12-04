class GenreMoviesList {
  GenreMoviesList({this.id, this.name});
  int? id;
  String? name;

  factory GenreMoviesList.fromJson(Map<String, dynamic> json) =>
      GenreMoviesList(id: json['id'], name: json['name']);
}

class GenresResponse {
  GenresResponse({required this.genres});
  List<GenreMoviesList> genres;

  factory GenresResponse.fromJson(Map<String, dynamic> json) => GenresResponse(
        genres: List<GenreMoviesList>.from(
            json["genres"].map((x) => GenreMoviesList.fromJson(x))),
      );
}
