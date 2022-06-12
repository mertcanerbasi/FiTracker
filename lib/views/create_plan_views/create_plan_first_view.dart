// ignore_for_file: use_build_context_synchronously

import 'package:fitness_app/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/assets_manager.dart';
import '../../managers/color_manager.dart';
import '../../managers/routes_manager.dart';
import '../../managers/strings_manager.dart';
import '../../managers/values_manager.dart';
import '../../services/auth.dart';

class CreatePlanFirstView extends StatelessWidget {
  const CreatePlanFirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
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
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      AppStrings.greatSoLetsStart,
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
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await FireStoreService().updateGender(
                                authService.activeUserId,
                                gender: "Male");
                            Navigator.pushNamed(
                                context, Routes.createPlanSecond);
                          },
                          child: Container(
                            alignment: Alignment.topLeft,
                            width: AppSize.s120,
                            decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(AppSize.s20),
                            ),
                            child: Center(
                                child: Text(
                              AppStrings.male,
                              style: Theme.of(context).textTheme.button,
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await FireStoreService().updateGender(
                                authService.activeUserId,
                                gender: "Female");
                            Navigator.pushNamed(
                                context, Routes.createPlanSecond);
                          },
                          child: Container(
                            alignment: Alignment.topLeft,
                            width: AppSize.s120,
                            decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(AppSize.s20),
                            ),
                            child: Center(
                                child: Text(
                              AppStrings.female,
                              style: Theme.of(context).textTheme.button,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
