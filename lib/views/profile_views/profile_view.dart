import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/strings_manager.dart';
import 'package:fitness_app/managers/theme_manager.dart';
import 'package:fitness_app/managers/values_manager.dart';
import 'package:fitness_app/widgets/profile_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/routes_manager.dart';
import '../../services/auth.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(
            flex: 1,
          ),
          Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.grey1,
                        image: DecorationImage(
                            image: NetworkImage(
                              authService.activeUser!.fotoUrl.toString(),
                            ),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Expanded(
                      flex: 1,
                      child: Text(
                        authService.activeUser!.userName.toString(),
                        style: getApplicationTheme().textTheme.headline3,
                      )),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                ],
              )),
          const Spacer(
            flex: 1,
          ),
          ProfileButtons(
              buttonText: AppStrings.personalInfo,
              buttonIcon: Icons.info,
              routeName: Routes.profileSettings),
          const Spacer(
            flex: 1,
          ),
          ProfileButtons(
              buttonText: AppStrings.progress,
              buttonIcon: Icons.history,
              routeName: Routes.profileSettings),
          const Spacer(
            flex: 1,
          ),
          ProfileButtons(
            buttonText: AppStrings.settings,
            buttonIcon: Icons.settings_outlined,
            routeName: Routes.profileSettings,
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    ));
  }
}
