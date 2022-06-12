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

class CreatePlanThirdView extends StatelessWidget {
  const CreatePlanThirdView({Key? key}) : super(key: key);

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
                    flex: 2,
                    child: Text(
                      AppStrings.objective,
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
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () async {
                              await FireStoreService().updateObjective(
                                  authService.activeUserId,
                                  objective: AppStrings.getBackInShape);
                              Navigator.pushNamed(
                                  context, Routes.createPlanFourth);
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: ColorManager.primary,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s20),
                              ),
                              child: Center(
                                  child: Text(
                                AppStrings.getBackInShape,
                                style: Theme.of(context).textTheme.button,
                              )),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () async {
                              await FireStoreService().updateObjective(
                                  authService.activeUserId,
                                  objective: AppStrings.loseWeight);
                              Navigator.pushNamed(
                                  context, Routes.createPlanFourth);
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: ColorManager.primary,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s20),
                              ),
                              child: Center(
                                  child: Text(
                                AppStrings.loseWeight,
                                style: Theme.of(context).textTheme.button,
                              )),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () async {
                              await FireStoreService().updateObjective(
                                  authService.activeUserId,
                                  objective: AppStrings.buildGreatBody);
                              Navigator.pushNamed(
                                  context, Routes.createPlanFourth);
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: ColorManager.primary,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s20),
                              ),
                              child: Center(
                                  child: Text(
                                AppStrings.buildGreatBody,
                                style: Theme.of(context).textTheme.button,
                              )),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () async {
                              await FireStoreService().updateObjective(
                                  authService.activeUserId,
                                  objective: AppStrings.bulkUp);
                              Navigator.pushNamed(
                                  context, Routes.createPlanFourth);
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: ColorManager.primary,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s20),
                              ),
                              child: Center(
                                  child: Text(
                                AppStrings.bulkUp,
                                style: Theme.of(context).textTheme.button,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
