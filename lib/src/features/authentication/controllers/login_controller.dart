import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    String? error = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
    if(error != null) {
        Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }

  }
}