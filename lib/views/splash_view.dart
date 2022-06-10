import 'dart:async';

import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/services/firestore_service.dart';
import 'package:fitness_app/views/login_view.dart';
import 'package:fitness_app/views/navigation_view.dart';
import 'package:fitness_app/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../managers/routes_manager.dart';
import '../models/users.dart';
import '../services/auth.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context, listen: false);
    return StreamBuilder(
        stream: _authService.stateControl,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: ColorManager.primary,
              body: Center(child: Image.asset("assets/images/splash_logo.png")),
            );
          }
          if (snapshot.hasData) {
            AppUsers activeUser = snapshot.data as AppUsers;
            _authService.activeUserId = activeUser.id;

            return NavigationView();
          } else {
            return LoginView();
          }
        });
  }
}
