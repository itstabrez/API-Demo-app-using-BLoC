import 'package:flutter/material.dart';
import 'package:flutter_api_using_bloc_1/home/ui/home_page.dart';
import 'package:flutter_api_using_bloc_1/login/ui/login_page.dart';

import 'routes_key.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.splash:
      //   return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.screenLogin:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      case Routes.screenHomePage:
        return MaterialPageRoute(builder: (context) => const HomePage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Error"),
          ),
          body: const Center(
            child: Text("Page not found!"),
          ),
        );
      },
    );
  }
}
