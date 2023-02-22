import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {

  String? username;

  String? password;

  bool? verifyUser = false;

  bool isLoading = false;

  Future checkLogin(String? userName, String? passWord, Function(bool isValid) isValid) async {

    if (userName != null && passWord != null) {
      username  = userName;
      password = passWord;
      await Future.delayed(const Duration(milliseconds: 5000), () {
        isLoading = true;
        if (username == 'Thiago' && password == '123') {
          isLoading = false;
          verifyUser = true;
          isValid(verifyUser ?? false);
          notifyListeners();
        }
      });
    }
    else {
      verifyUser = false;
      isLoading = false;
      isValid(verifyUser ?? false);
      notifyListeners();
    }
  }
}