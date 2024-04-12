import 'package:flutter/material.dart';
import 'package:google_auth_app/presentation/resource/color_manager.dart';
import 'package:google_auth_app/presentation/resource/string_manager.dart';
import 'package:google_auth_app/presentation/screen/home/home_screen.dart';
import 'package:google_auth_app/presentation/screen/signin/signin_screen.dart';
import 'package:google_auth_app/presentation/screen/splash/splash_screen.dart';

class Routes {
  static const splashRoute = "/";
  static const signInRoute = "/signIn";
  static const homeRoute = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(
            StringManager.noRouteFound,
            style: Theme.of(_).textTheme.displaySmall,
          ),
        ),
        backgroundColor: ColorManager.black,
        body: Center(
          child: Text(
            StringManager.noRouteFound,
            style: Theme.of(_).textTheme.displaySmall,
          ),
        ),
      ),
    );
  }
}