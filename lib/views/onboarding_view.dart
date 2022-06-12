import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/theme_manager.dart';
import 'package:fitness_app/managers/values_manager.dart';
import 'package:fitness_app/views/exercises_views/exercises_view.dart';
import 'package:fitness_app/views/profile_views/profile_view.dart';
import 'package:fitness_app/views/diet_plans_views/diet_plans_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../managers/routes_manager.dart';
import '../services/auth.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int _selectedIndex = 0;

  void _onPageSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final List<Widget> pages = [
      const ExercisesView(),
      const DietPlansView(),
      const ProfileView(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('FiTracker'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: DropdownButton<String>(
              dropdownColor: ColorManager.white,
              icon: const Icon(Icons.menu),
              elevation: 0,
              iconEnabledColor: ColorManager.white,
              style: getApplicationTheme().textTheme.bodyText2,
              underline: const SizedBox(),
              onChanged: (String? newValue) {
                if (newValue == "Logout") {
                  authService.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.splashRoute, (route) => true);
                }
              },
              items: <String>['Settings', 'Logout']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    height: 20,
                    width: 70,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_mma),
            label: "Exercises",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dinner_dining),
            label: "Diet Plans",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onPageSelected,
        selectedIconTheme: IconThemeData(
          color: getApplicationTheme().primaryColor,
        ),
        selectedItemColor: getApplicationTheme().primaryColor,
      ),
    );
  }
}
