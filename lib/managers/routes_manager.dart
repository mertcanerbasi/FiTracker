import 'package:fitness_app/views/create_plan_views/create_plan_first_view.dart';
import 'package:fitness_app/views/navigation_view.dart';
import 'package:flutter/material.dart';

import '../views/create_plan_views/create_plan_fifth_view.dart';
import '../views/create_plan_views/create_plan_fourth.dart';
import '../views/create_plan_views/create_plan_second_view.dart';
import '../views/create_plan_views/create_plan_third_view.dart';
import '../views/forgot_password_view.dart';
import '../views/login_view.dart';
import '../views/onboarding_view.dart';
import '../views/register_view.dart';
import '../views/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String createPlanFirst = "/createPlanFirst";
  static const String createPlanSecond = "/createPlanSecond";
  static const String createPlanThird = "/createPlanThird";
  static const String createPlanFourth = "/createPlanFourth";
  static const String createPlanFifth = "/createPlanFifth";
  static const String navigation = "/navigation";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.navigation:
        return MaterialPageRoute(builder: (_) => const NavigationView());
      case Routes.createPlanFirst:
        return MaterialPageRoute(builder: (_) => const CreatePlanFirstView());
      case Routes.createPlanSecond:
        return MaterialPageRoute(builder: (_) => const CreatePlanSecondView());
      case Routes.createPlanThird:
        return MaterialPageRoute(builder: (_) => const CreatePlanThirdView());
      case Routes.createPlanFourth:
        return MaterialPageRoute(builder: (_) => const CreatePlanFourthView());
      case Routes.createPlanFifth:
        return MaterialPageRoute(builder: (_) => const CreatePlanFifthView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Routes Found"),
              ),
              body: const Center(child: Text("No Routes Found")),
            ));
  }
}
