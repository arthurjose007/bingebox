
import '../../utils/coponent/shared/constant/constant.dart';

class ApiEndPoints {
  static const String baseURL =
      'https://api.themoviedb.org/3/';
  var key ="?api_key=$apiKey";
  static const String upcomingMovie = "movie/upcoming";
  static const String nowPlayingMovie = "movie/now_playing";
  static const String topRatedMovie = "movie/top_rated";
  static const String popularMovie = "movie/popular";
  static const String tvTopRatedMovie= "tv/top_rated";
  static const String movieSearch= "search/tv?query=";
  static const String detailOfMovie= "movie/";
  static const String detailOfTv= "tv/";
  static const String recommendations= "/recommendations";

}
