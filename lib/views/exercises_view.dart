import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/users.dart';
import '../services/auth.dart';

class ExercisesView extends StatelessWidget {
  const ExercisesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context, listen: false);
    bool isLoading = false;
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: double.maxFinite,
            child: Center(
              child: Text(
                "Exercises",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.maxFinite,
            child: Center(
              child: Text(
                "Gender : ${_authService.activeUser?.gender}",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
