import 'package:flutter/material.dart';
import 'package:mvvm_demo/src/config/routes.dart';
import 'package:mvvm_demo/src/domain/repository/api_repository.dart';
import 'package:mvvm_demo/src/presentation/views/common_widgets/toast_widget.dart';

class LoginProvider extends ChangeNotifier {
  final AppRepository _appRepository = AppRepository();

  bool _isLoading = false;
  
  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> handleUserLogin(
      String userName, String password, BuildContext context) async {
    Map<String, String> userData = {"email": userName, "password": password};
    setLoading(true);
    await _appRepository.callUserLoginApi(userData).then((value) {
      if (value != null) {
        setLoading(false);
        Navigator.pushNamed(context, AppRoutes.homeScreen);
      } else {
        setLoading(false);
        showCommonToast("Something went wrong!!");
      }
    }).onError(
      (error, stackTrace) {
        setLoading(false);
        showCommonToast("Something went wrong!!");
        debugPrint(error.toString());
      },
    );
  }
}
