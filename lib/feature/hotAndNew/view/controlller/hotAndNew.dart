import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/utils/coponent/shared/component/widgets/custom_alert.dart';
import '../../../../core/utils/coponent/shared/component/widgets/custom_tost.dart';
import '../../../homepage/view/model/upcomingmodel.dart';
import '../repository/hotandNewrepo.dart';

class HotReloadController extends ChangeNotifier{
  bool isLoading = false;
  bool popularIsLoading = false;

  final _api = HotandNewRepo();
  List<ResultModel> movie = [];
  String upcomingerrrormessage = '';
  List<ResultModel> popularList = [];
  String popularMovieerrrormessage = '';


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
}