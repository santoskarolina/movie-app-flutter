import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie.model.dart';
import 'package:movie_app/utils/constants.dart';

const imageUrl = 'https://image.tmdb.org/t/p/w500';
const baseUrl = 'https://api.themoviedb.org/3/';
var key = '?api_key=$acessKey';
late String endPoint;

Future<MoviesReponse> getPopularMovies() async {
  endPoint = 'movie/popular';
  final url = "$baseUrl$endPoint$key";

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return modelFromJson(response.body);
  } else {
    throw Exception('failed to load data');
  }
}

Future<MoviesReponse> getTopRatedMovies() async {
  endPoint = 'movie/top_rated';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return modelFromJson(response.body);
  } else {
    throw Exception('failed to load data');
  }
}

Future<MoviesReponse> getPopularTvShows() async {
  endPoint = 'tv/popular';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return modelFromJson(response.body);
  } else {
    throw Exception('failed to load data');
  }
}

Future<Movie> getMoviebyId(int id) async {
  endPoint = 'movie/$id';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return movieFromJson(response.body);
  } else {
    throw Exception('failed to load data');
  }
}
