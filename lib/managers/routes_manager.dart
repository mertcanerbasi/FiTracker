import 'package:fitness_app/views/create_plan_views/create_plan_first_view.dart';
import 'package:fitness_app/views/diet_plans_views/carnivore_diet_view.dart';
import 'package:fitness_app/views/diet_plans_views/intermittent_fasting_views/intermittent_fasting_definition_view.dart';
import 'package:fitness_app/views/diet_plans_views/intermittent_fasting_views/intermittent_fasting_plans_view.dart';
import 'package:fitness_app/views/diet_plans_views/ketogenic_diet_view.dart';
import 'package:fitness_app/views/diet_plans_views/mediterrian_diet_view.dart';
import 'package:fitness_app/views/diet_plans_views/paleo_diet_view.dart';
import 'package:fitness_app/views/diet_plans_views/vegan_diet_view.dart';
import 'package:fitness_app/views/exercises_views/cycling_view.dart';
import 'package:fitness_app/views/exercises_views/fitness_view.dart';
import 'package:fitness_app/views/exercises_views/running_view.dart';
import 'package:fitness_app/views/exercises_views/swimming_view.dart';
import 'package:fitness_app/views/navigation_view.dart';
import 'package:fitness_app/views/profile_views/profile_settings_view.dart';
import 'package:flutter/material.dart';

import '../views/create_plan_views/create_plan_fifth_view.dart';
import '../views/create_plan_views/create_plan_fourth.dart';
import '../views/create_plan_views/create_plan_second_view.dart';
import '../views/create_plan_views/create_plan_third_view.dart';
import '../views/diet_plans_views/intermittent_fasting_views/intermittent_fasting_select_plan_view.dart';
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
  static const String swimming = "/swimming";
  static const String running = "/running";
  static const String fitness = "/fitness";
  static const String cycling = "/cycling";
  static const String profileSettings = "/profileSettings";
  static const String intermittentFasting = "/intermittentFasting";
  static const String intermittentFastingPlans = "/intermittentFastingPlans";
  static const String intermittentFastingSelectPlan =
      "/intermittentFastingSelectPlan";
  static const String mediterrianDiet = "/mediterrianDiet";
  static const String ketogenicDiet = "/ketogenicDiet";
  static const String veganDiet = "/veganDiet";
  static const String carnivoreDiet = "/carnivoreDiet";
  static const String paleoDiet = "/paleoDiet";
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
      case Routes.swimming:
        return MaterialPageRoute(builder: (_) => const SwimmingView());
      case Routes.running:
        return MaterialPageRoute(builder: (_) => const RunningView());
      case Routes.fitness:
        return MaterialPageRoute(builder: (_) => const FitnessView());
      case Routes.cycling:
        return MaterialPageRoute(builder: (_) => const CyclingView());
      case Routes.profileSettings:
        return MaterialPageRoute(builder: (_) => const ProfileSettingsView());
      case Routes.intermittentFasting:
        return MaterialPageRoute(
            builder: (_) => const IntermitttentFastingDefinitionView());
      case Routes.intermittentFastingPlans:
        return MaterialPageRoute(
            builder: (_) => const IntermitttentFastingPlansView());
      case Routes.intermittentFastingSelectPlan:
        return MaterialPageRoute(
            builder: (_) => const IntermitttentFastingSelectPlanView());
      case Routes.mediterrianDiet:
        return MaterialPageRoute(builder: (_) => const MediterrianDietView());
      case Routes.ketogenicDiet:
        return MaterialPageRoute(builder: (_) => const KetogenicDietView());
      case Routes.veganDiet:
        return MaterialPageRoute(builder: (_) => const VeganDietView());
      case Routes.carnivoreDiet:
        return MaterialPageRoute(builder: (_) => const CarnivoreDietView());
      case Routes.paleoDiet:
        return MaterialPageRoute(builder: (_) => const PaleoDietView());
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
