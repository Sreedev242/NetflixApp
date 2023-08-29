import 'package:netflix_app/core/strings.dart';
import 'package:netflix_app/infrastructure/api_key.dart';

class ApiEndPoints {
  static const x = "$kBaseURL/trending/movie/day?api_key=$apiKey";
  static const searchPageUrl='https://api.themoviedb.org/3/search/movie?api_key=d500c0fa259937868d67e5961bb928b9';
static const hotAndNewMovieURL="$kBaseURL/discover/movie?api_key=$apiKey";
static const hotAndNewTvURL="$kBaseURL/discover/tv?api_key=$apiKey";
}
