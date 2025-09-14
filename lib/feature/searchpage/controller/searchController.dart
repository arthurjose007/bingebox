import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../core/utils/coponent/shared/component/widgets/custom_alert.dart';
import '../../../core/utils/coponent/shared/component/widgets/custom_tost.dart';

import '../model/RecommendationsModel.dart';
import '../model/movieDetailModdel.dart';
import '../model/searchMoviemodel.dart';
import '../repository/search_repo.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController textController = TextEditingController();

  List<SearchResults> searcList = [];
  List<MovieDetailModel> movieDetailsList = [];
  List<MovieDetailModel> tvDetailsList = [];
  List<RecommendationsModel> recommendationList = [];
  List<RecommendationsModel> tvrecommendationList = [];
  bool searchIsLoading = false;
  bool movieDetLoading = false;
  bool tvDetLoading = false;
  bool recommendationIsLoading = false;
  bool tvrecommendationIsLoading = false;
  final _api = SearchRepo();
  String errorMessage = '';
  String movieDetErrorMessage = '';
  String tvDetailsErrorMessage = '';
  String tvrecommendationErrorMessage = '';
  void searchClear() {
    searcList.clear();
    notifyListeners();
  }

  Future<void> searchTvSeriesController(
      BuildContext context, String search) async {
    try {
      searchIsLoading = true;
      notifyListeners();
      final response = await _api.searchMovie(search);

      if (response != null && response['status'] == 200) {
        // var tvSeriesModel = TvSeriesModel.fromJson(response["data"]);
        // tvResult =  List<ResultsTv>.from(tvSeriesModel.results ?? []);
        searcList = (response["data"]['results'] as List).map((item) {
          return SearchResults.fromJson(item);
        }).toList();
        print(response["data"]['results']);

        notifyListeners();
      } else if (response != null && response['status'] == 500) {
        errorMessage = response['data'];
        CustomToast.showCustomErrorToast(
            message: "${response['status_message']}");
        notifyListeners();
      } else if (response != null && response['status'] == 404) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          CustomAlertDialog.showCustomAlertDialog(
            context: context,
            title: 'Failed',
            message: "${response['data']['status_message']}",
            cancelText: 'Ok',
            onCancelPressed: () {
               Navigator.of(context).pop();
               Navigator.of(context).pop();
            },
          );
        });
        notifyListeners();
      } else {
        CustomToast.showCustomErrorToast(message: "Unexpected error occurred");
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    } finally {
      searchIsLoading = false;
      notifyListeners();
    }
  }

  Future<void> movieDetailsController(BuildContext context, int movieId) async {
    try {
      print(movieId);
      movieDetLoading = true;
      notifyListeners();
      final response = await _api.movieDetailPage(movieId);

      if (response != null && response['status'] == 200) {
        print(response["data"]);
        var movieDetail = MovieDetailModel.fromJson(response["data"]);
        movieDetailsList = [movieDetail];

        print("This is the movie detail data");
        print(movieDetailsList);

        notifyListeners();
      } else if (response != null && response['status'] == 500) {
        movieDetErrorMessage = response['data'];
        CustomToast.showCustomErrorToast(
            message: "${response['status_message']}");
        notifyListeners();
      } else if (response != null && response['status'] == 404) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          CustomAlertDialog.showCustomAlertDialog(
            context: context,
            title: 'Failed',
            message: "${response['data']['status_message']}",
            cancelText: 'Ok',
            onCancelPressed: () {
              Navigator.of(context).pop();
               Navigator.of(context).pop();
            },
          );
        });
        notifyListeners();
      } else {
        CustomToast.showCustomErrorToast(message: "Unexpected error occurred");
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    } finally {
      movieDetLoading = false;
      notifyListeners();
    }
  }
  Future<void> tvDetailsController(BuildContext context, int movieId) async {
    try {
      print(movieId);
      tvDetLoading = true;
      notifyListeners();
      final response = await _api.tvDetailPage(movieId);

      if (response != null && response['status'] == 200) {
        print(response["data"]);
        var movieDetail = MovieDetailModel.fromJson(response["data"]);
        tvDetailsList = [movieDetail];

        print("This is the movie detail data");
        print(tvDetailsList);

        notifyListeners();
      } else if (response != null && response['status'] == 500) {
        tvDetailsErrorMessage = response['data'];
        CustomToast.showCustomErrorToast(
            message: "${response['status_message']}");
        notifyListeners();
      } else if (response != null && response['status'] == 404) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          CustomAlertDialog.showCustomAlertDialog(
            context: context,
            title: 'Failed',
            message: "${response['data']['status_message']}",
            cancelText: 'Ok',
            onCancelPressed: () {
              Navigator.of(context).pop();
               Navigator.of(context).pop();
            },
          );
        });
        notifyListeners();
      } else {
        CustomToast.showCustomErrorToast(message: "Unexpected error occurred");
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    } finally {
      tvDetLoading = false;
      notifyListeners();
    }
  }

  Future<void> tvrecommendationsController(
      BuildContext context, int movieId) async {
    try {
      tvrecommendationIsLoading = true;
      notifyListeners();
      final response = await _api.tvrecommendationsMoviePage(movieId);

      if (response != null && response['status'] == 200) {
        // var tvSeriesModel = TvSeriesModel.fromJson(response["data"]);
        // tvResult =  List<ResultsTv>.from(tvSeriesModel.results ?? []);
        tvrecommendationList = (response["data"]['results'] as List).map((item) {
          return RecommendationsModel.fromJson(item);
        }).toList();

        notifyListeners();
      } else if (response != null && response['status'] == 500) {
        tvrecommendationErrorMessage = response['data'];
        CustomToast.showCustomErrorToast(
            message: "${response['status_message']}");
        notifyListeners();
      } else if (response != null && response['status'] == 404) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          CustomAlertDialog.showCustomAlertDialog(
            context: context,
            title: 'Failed',
            message: "${response['data']['status_message']}",
            cancelText: 'Ok',
            onCancelPressed: () {
               Navigator.of(context).pop();
               Navigator.of(context).pop();
            },
          );
        });
        notifyListeners();
      } else {
        CustomToast.showCustomErrorToast(message: "Unexpected error occurred");
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    } finally {
      tvrecommendationIsLoading = false;
      notifyListeners();
    }
  }
  Future<void> recommendationsController(
      BuildContext context, int movieId) async {
    try {
      recommendationIsLoading = true;
      notifyListeners();
      final response = await _api.recommendationsMoviePage(movieId);

      if (response != null && response['status'] == 200) {
        // var tvSeriesModel = TvSeriesModel.fromJson(response["data"]);
        // tvResult =  List<ResultsTv>.from(tvSeriesModel.results ?? []);
        recommendationList = (response["data"]['results'] as List).map((item) {
          return RecommendationsModel.fromJson(item);
        }).toList();

        notifyListeners();
      } else if (response != null && response['status'] == 500) {
        errorMessage = response['data'];
        CustomToast.showCustomErrorToast(
            message: "${response['status_message']}");
        notifyListeners();
      } else if (response != null && response['status'] == 404) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          CustomAlertDialog.showCustomAlertDialog(
            context: context,
            title: 'Failed',
            message: "${response['data']['status_message']}",
            cancelText: 'Ok',
            onCancelPressed: () {
               Navigator.of(context).pop();
               Navigator.of(context).pop();
            },
          );
        });
        notifyListeners();
      } else {
        CustomToast.showCustomErrorToast(message: "Unexpected error occurred");
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    } finally {
      recommendationIsLoading = false;
      notifyListeners();
    }
  }

}
