import 'package:eusy/ui/auth/login-screen.dart';
import 'package:eusy/ui/auth/register_screen.dart';
import 'package:eusy/ui/user-form.dart';
import 'package:get/get.dart';

import '../button_nav_controller/button_nav-controller.dart';
import '../splash-screen.dart';

const String splash = '/splash-screen';

const String signUp = '/sign-up-screen';
const String signIn = '/sign-in-screen';
const String userForm = '/user-form-screen';
const String bottonNavBar = '/bottonNavBar';


//  control our page route flow

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: signIn,
    page: () => LoginScreen(),
  ),
  GetPage(
    name: signUp,
    page: () => RegistrationScreen(),
  ),
  GetPage(
    name: userForm,
    page: () => UserForm(),
  ),
  GetPage(
    name: bottonNavBar,
    page: () => BottomNavController(),
  ),
];
