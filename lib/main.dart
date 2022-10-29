import 'package:eusy/ui/auth/register_screen.dart';
import 'package:eusy/ui/button_nav_controller/button_nav-controller.dart';
import 'package:eusy/ui/button_nav_controller/pages/home.dart';
import 'package:eusy/ui/route/route.dart';
import 'package:eusy/ui/splash-screen.dart';
import 'package:eusy/ui/user-form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 811),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'e-commerce',

            initialRoute: splash,
            getPages: getPages,
            home: SplashScreen(),
          );
        });
  }
}
