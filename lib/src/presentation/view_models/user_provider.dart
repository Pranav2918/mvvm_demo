import 'package:flutter/material.dart';
import 'package:mvvm_demo/src/data/model/user_model.dart';
import 'package:mvvm_demo/src/domain/repository/api_repository.dart';

class UserListProvider extends ChangeNotifier {
  final AppRepository _appRepository = AppRepository();

  Users users = Users();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Users> fetchUserList() async {
    setLoading(true);
    try {
      await _appRepository.callUserListingApi().then((value) {
        users = value!;
        setLoading(false);
      });
      return users;
    } catch (error) {
      setLoading(false);
      throw Exception('Error fetching user list: $error');
    }
  }
}
