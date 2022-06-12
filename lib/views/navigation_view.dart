import 'package:fitness_app/managers/assets_manager.dart';
import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/strings_manager.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/services/auth.dart';
import 'package:fitness_app/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../managers/routes_manager.dart';
import '../managers/values_manager.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return FutureBuilder<AppUsers?>(
        future: authService.setActiveUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            authService.activeUser = snapshot.data as AppUsers;
            if (authService.activeUser?.programCreated == true) {
              return const OnBoardingView();
            } else {
              return Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  body: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(ImageAssets.createPlan),
                          fit: BoxFit.fill,
                        )),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p30),
                        width: double.maxFinite,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(
                              flex: 13,
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                AppStrings.yourOwnPersonalGymCoach,
                                style: Theme.of(context).textTheme.headline1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Divider(
                              color: ColorManager.primary,
                              thickness: 2,
                              height: 0,
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                AppStrings.inLessThan2Min,
                                style: Theme.of(context).textTheme.headline2,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.createPlanFirst);
                                },
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  width: AppSize.s120,
                                  decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s20),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "Create Plan",
                                    style: Theme.of(context).textTheme.button,
                                  )),
                                ),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
            }
          } else {
            return Scaffold(
              backgroundColor: ColorManager.primary,
              body: Center(child: Image.asset("assets/images/splash_logo.png")),
            );
          }
        });
  }
}
