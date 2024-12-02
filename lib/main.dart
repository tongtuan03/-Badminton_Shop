import 'package:batminton_shop/src/features/authentication/screens/onboard_screen/onboard_screen.dart';
import 'package:batminton_shop/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:batminton_shop/src/utilis/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase . initializeApp (
    options : DefaultFirebaseOptions . currentPlatform ,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home:  SplashScreen(),
    );
  }
}

