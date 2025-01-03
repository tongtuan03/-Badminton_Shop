import 'package:batminton_shop/src/features/authentication/screens/onboard_screen/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/welcome_screen/welcome_screen.dart';

class SplashScreenController extends GetxController{
  static SplashScreenController get find => Get.find();


  RxBool animate = false.obs;


  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    Get.to(OnBoardingScreen());


  }
}