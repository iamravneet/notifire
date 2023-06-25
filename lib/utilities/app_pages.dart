import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:notifire/screens/login/login_screen.dart';
import 'package:notifire/screens/registration/register_screen.dart';
import 'package:notifire/utilities/routes.dart';

class AppPages {

  static const initialPage = Routes.loginScreen;
  static final pages = [
    GetPage(
        name: Routes.loginScreen,
        page: () => const LoginScreen()
    ),

    GetPage(
        name: Routes.registerScreen,
        page: () => const RegisterScreen()
    ),
  ];
}