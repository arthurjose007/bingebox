
import '../../../../core/helper/network/api_endpoints.dart';
import '../../../../core/helper/network/network_api_services.dart';
import '../../../../core/utils/coponent/shared/constant/constant.dart';
const key="?api_key=$apiKey";
class UpcomingMovieRepo{
  final _apiService=NetworkApiServices();
  Future<dynamic> upcomingRepo()async{
    dynamic response=await _apiService.getApi("${ApiEndPoints.baseURL}${ApiEndPoints.upcomingMovie}$key",);
    return response;
  }
  Future<dynamic> nowPlayingRepo()async{
    dynamic response=await _apiService.getApi("${ApiEndPoints.baseURL}${ApiEndPoints.nowPlayingMovie}$key",);
    return response;
  }
  Future<dynamic> topRatedRepo()async{
    dynamic response=await _apiService.getApi("${ApiEndPoints.baseURL}${ApiEndPoints.topRatedMovie}$key",);
    return response;
  }
  Future<dynamic> popularRepo()async{
    dynamic response=await _apiService.getApi("${ApiEndPoints.baseURL}${ApiEndPoints.popularMovie}$key",);
    return response;
  }
  Future<dynamic> tvSeriesRepo()async{
    dynamic response=await _apiService.getApi("${ApiEndPoints.baseURL}${ApiEndPoints.tvTopRatedMovie}$key",);
    return response;
  }

}








