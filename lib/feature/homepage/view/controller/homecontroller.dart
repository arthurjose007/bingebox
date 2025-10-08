import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/utils/coponent/shared/component/widgets/custom_alert.dart';
import '../../../../core/utils/coponent/shared/component/widgets/custom_tost.dart';
import '../model/tvseries_model.dart';
import '../model/upcomingmodel.dart';
import 'package:http/http.dart' as http;

import '../repository/homePage_repo.dart';

class HomePageProvider extends ChangeNotifier {
  bool isLoading = false;
  bool nowisLoading = false;
  bool topRatedIsLoading = false;
  bool popularIsLoading = false;
  bool tvisLoading = false;
  HomePageProvider(){
    isLoading=true;
    nowisLoading=true;
    topRatedIsLoading=true;
    popularIsLoading=true;
    tvisLoading=true;
  }
   // bool isLoading = false;

  List<ResultModel> movie = [];
  List<ResultModel> nowPlayMovie = [];
  List<ResultModel> topRated = [];
  List<ResultModel> popularList = [];
  List<ResultsTv> tvResult = [];

  final _api = UpcomingMovieRepo();
  String upcomingerrrormessage = '';
  String nowplayingerrrormessage = '';
  String topRatederrrormessage = '';
  String popularMovieerrrormessage = '';
  String tvSerieserrrormessage = '';
  bool _isLoading = true;
  bool _hasError = false;
  bool get isLoadings => _isLoading;
  bool get hasError => _hasError;

  Future<void> initializeData(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      // Load sequentially or in a specific order
      await popularMovieController(context);
      await topRatedController(context);
      await nowplayingController(context);
      await upcomingMoviesController(context);
      await tvSeriesController(context);

    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

///Upcoming Movies Controller
  Future<void> upcomingMoviesController(BuildContext context) async {
    isLoading = true;

    try {
      notifyListeners();
      final response = await _api.upcomingRepo();
      print("response of the data");
      print(response["data"]['results']);

      if (response != null && response['status'] == 200) {
        final items = (response["data"]['results'] as List)
            .map((item) => ResultModel.fromJson(item))
            .toList();
        movie = items;
        notifyListeners();
      } else if (response != null && response['status'] == 500) {
        upcomingerrrormessage = response['data'];
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
      isLoading = false;
      notifyListeners();
    }
  }
///Now Playing Controller
  Future<void> nowplayingController(BuildContext context) async {
    try {
      nowisLoading = true;
      notifyListeners();
      final response = await _api.nowPlayingRepo();
      print("now playing");
       print(response["data"]['results']);

      if (response != null && response['status'] == 200) {
        final items = (response["data"]['results'] as List)
            .map((item) => ResultModel.fromJson(item))
            .toList();
        nowPlayMovie = items;
        // nowPlayMovie.sort((a, b) => a.length.compareTo(b.length));
        notifyListeners();
      } else if (response != null && response['status'] == 500) {
        nowplayingerrrormessage = response['data'];
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
      nowisLoading = false;
      notifyListeners();
    }
  }

  ///topRated Movie Controller
  Future<void> topRatedController(BuildContext context) async {
    try {
      topRatedIsLoading = true;
      notifyListeners();
      final response = await _api.topRatedRepo();
      print("Top Rated");
      //print(response["data"]['results']);

      if (response != null && response['status'] == 200) {
        final items = (response["data"]['results'] as List)
            .map((item) => ResultModel.fromJson(item))
            .toList();
        topRated = items;
        notifyListeners();
      } else if (response != null && response['status'] == 500) {
        topRatederrrormessage = response['data'];
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
      topRatedIsLoading = false;
      notifyListeners();
    }
  }
///Popular Movie Controller
  Future<void> popularMovieController(BuildContext context) async {
    try {
      popularIsLoading = true;
      notifyListeners();
      final response = await _api.popularRepo();
      print("popular Repo");
      print(response["data"]['results']);

      if (response != null && response['status'] == 200) {
        final items = (response["data"]['results'] as List)
            .map((item) => ResultModel.fromJson(item))
            .toList();
        popularList = items;
        popularList.shuffle();
        notifyListeners();
      } else if (response != null && response['status'] == 500) {
        popularMovieerrrormessage = response['data'];
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
      popularIsLoading = false;
      notifyListeners();
    }
  }
///Tv series Controller
  Future<void> tvSeriesController(BuildContext context) async {
    try {
      tvisLoading = true;
      notifyListeners();
      final response = await _api.tvSeriesRepo();
      print("response of the data");
      if (response != null && response['status'] == 200) {


        final items = (response["data"]['results'] as List)
            .map((item) => ResultsTv.fromJson(item))
            .toList();
        tvResult = items;
        notifyListeners();
      } else if (response != null && response['status'] == 500) {
        tvSerieserrrormessage = response['data'];
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
      tvisLoading = false;
      notifyListeners();
    }
  }
}
