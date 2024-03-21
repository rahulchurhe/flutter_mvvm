import 'package:flutter/material.dart';
import '../view/onboarding/login_screen.dart';
import '../view/onboarding/api_list_screen.dart';
import 'route_name.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.screenApiList:
        return MaterialPageRoute(
            builder: (BuildContext context) => const APIListScreen());

      case RoutesName.screenLogin:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());

      default:
        /*Close the app when back button is pressed*/
        return null;
      /*Return null to indicate that there is no route*/
    }
  }
}
