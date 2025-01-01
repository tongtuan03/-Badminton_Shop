import 'package:batminton_shop/src/constants/login_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  RxBool showPassword = false.obs;
  RxBool isLoading = false.obs;
  RxBool isFacebookLoading = false.obs;
  RxBool isGoogleLoading = false.obs;

  /// TextField Validation

  //Call this Function from Design & it will do the rest
  Future<void> login() async {
    Get.put(AuthenticationRepository());
    String? error = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
    if(error != null) {
        Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
    else{
      saveLoginStatus(Logged_In);
    }

  }
  Future<void> saveLoginStatus(String status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', status);
  }

  Future<String?> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  Future<void> logout() async {
    saveLoginStatus(Logged_Out);
    AuthenticationRepository.instance.logout();
  }
}