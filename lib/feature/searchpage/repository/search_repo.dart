
import '../../../core/helper/network/api_endpoints.dart';
import '../../../core/helper/network/network_api_services.dart';
import '../../../core/utils/coponent/shared/constant/constant.dart';

const key = "?api_key=$apiKey";

class SearchRepo {
  final _apiService = NetworkApiServices();

  Future<dynamic> searchMovie(String search) async {
    dynamic response = await _apiService.getApi(
        "${ApiEndPoints.baseURL}${ApiEndPoints.movieSearch}$search",
        token: apiToken);
    print("This is repo");
    // print(response);
    return response;
  }
  Future<dynamic> movieDetailPage(int movieId) async {
    dynamic response = await _apiService.getApi(
        "${ApiEndPoints.baseURL}${ApiEndPoints.detailOfMovie}$movieId",
        token: apiToken);
    return response;
  }
  Future<dynamic> tvDetailPage(int movieId) async {
    dynamic response = await _apiService.getApi(
        "${ApiEndPoints.baseURL}${ApiEndPoints.detailOfTv}$movieId",
        token: apiToken);
    return response;
  }
  Future<dynamic> recommendationsMoviePage(int movieId) async {
    dynamic response = await _apiService.getApi(
        "${ApiEndPoints.baseURL}${ApiEndPoints.detailOfMovie}$movieId${ApiEndPoints.recommendations}",
        token: apiToken);
    return response;
  }
  Future<dynamic> tvrecommendationsMoviePage(int movieId) async {
    dynamic response = await _apiService.getApi(
        "${ApiEndPoints.baseURL}${ApiEndPoints.detailOfTv}$movieId${ApiEndPoints.recommendations}",
        token: apiToken);
    return response;
  }
}
