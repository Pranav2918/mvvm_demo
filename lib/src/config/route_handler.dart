import 'package:flutter/material.dart';
import 'package:mvvm_demo/src/config/routes.dart';
import 'package:mvvm_demo/src/presentation/view_models/login_provider.dart';
import 'package:mvvm_demo/src/presentation/views/common_widgets/wrong_route_screen.dart';
import 'package:mvvm_demo/src/presentation/views/home/home_screen.dart';
import 'package:mvvm_demo/src/presentation/views/login/login_screen.dart';
import 'package:mvvm_demo/src/presentation/views/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class AppRouteHandler {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRoutes.loginScreen:
        final loginArguments = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  builder: (context, child) {
                    return LoginScreen(loginData: loginArguments);
                  },
                ));
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => const WrongRoute());
    }
  }
}
