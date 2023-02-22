import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {

  String? username;

  String? password;

  bool? verifyUser = false;

  Future checkLogin(String? userName, String? passWord, Function(bool isValid) isValid) async {

    if (userName != null && passWord != null) {
      username  = userName;
      password = passWord;
      await Future.delayed(const Duration(milliseconds: 5000), () {
        if (username == 'Thiago' && password == '123') {
          verifyUser = true;
          isValid(verifyUser ?? false);
          notifyListeners();
        }
      });
    }
    else {
      verifyUser = false;
      isValid(verifyUser ?? false);
      notifyListeners();
    }
  }
}