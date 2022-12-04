import 'package:dio/dio.dart';
import 'package:movie_app/models/genres.model.dart';
import 'package:movie_app/models/movie.model.dart';
import 'package:movie_app/utils/constants.dart';

const imageUrl = 'https://image.tmdb.org/t/p/w500';
const baseUrl = 'https://api.themoviedb.org/3/';
var key = '?api_key=$acessKey';
late String endPoint;

Future<MoviesReponse> getPopularMovies(bool movie) async {
  endPoint = movie ? 'movie/popular' : 'tv/popular';
  final url = "$baseUrl$endPoint$key";

  final response = await Dio().get(url);

  if (response.statusCode == 200) {
    return MoviesReponse.fromJson(response.data);
  } else {
    throw Exception('failed to load data');
  }
}

Future<MoviesReponse> getTopRatedMovies() async {
  endPoint = 'movie/top_rated';
  final url = '$baseUrl$endPoint$key';
  final response = await Dio().get(url);

  if (response.statusCode == 200) {
    return MoviesReponse.fromJson(response.data);
  } else {
    throw Exception('failed to load data');
  }
}

Future<MoviesReponse> getNowPlayingMovie() async {
  endPoint = 'movie/now_playing';
  final url = '$baseUrl$endPoint$key';
  final response = await Dio().get(url);

  if (response.statusCode == 200) {
    return MoviesReponse.fromJson(response.data);
  } else {
    throw Exception('failed to load data');
  }
}

Future<MoviesReponse> getSimilarMovies(id, bool movie) async {
  endPoint = movie ? 'movie/$id/similar' : 'tv/$id/similar';
  final url = '$baseUrl$endPoint$key';
  final response = await Dio().get(url);

  if (response.statusCode == 200) {
    return MoviesReponse.fromJson(response.data);
  } else {
    throw Exception('failed to load data');
  }
}

Future<Cast> getCast(id, bool movie) async {
  endPoint = movie ? 'movie/$id/credits' : 'tv/$id/credits';
  final url = '$baseUrl$endPoint$key';
  final response = await Dio().get(url);

  if (response.statusCode == 200) {
    return Cast.fromJson(response.data);
  } else {
    throw Exception('failed to load data');
  }
}

Future<Movie> getMoviebyId(int id, bool movie) async {
  endPoint = movie ? 'movie/$id' : 'tv/$id';
  final url = '$baseUrl$endPoint$key';

  final response = await Dio().get(url);
  if (response.statusCode == 200) {
    return Movie.fromJson2(response.data);
  } else {
    throw Exception('failed to load data');
  }
}

Future<GenresResponse> getGenres() async {
  endPoint = 'genre/movie/list';
  final url = '$baseUrl$endPoint$key';

  final response = await Dio().get(url);
  if (response.statusCode == 200) {
    return GenresResponse.fromJson(response.data);
  } else {
    throw Exception('failed to load data');
  }
}
