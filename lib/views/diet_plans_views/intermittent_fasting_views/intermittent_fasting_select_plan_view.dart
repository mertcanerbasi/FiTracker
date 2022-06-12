import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/strings_manager.dart';
import 'package:fitness_app/managers/theme_manager.dart';
import 'package:fitness_app/widgets/intermittent_fasting_image_button_widget.dart';
import 'package:fitness_app/widgets/intermittent_fasting_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../managers/assets_manager.dart';
import '../../../managers/routes_manager.dart';
import '../../../managers/values_manager.dart';
import '../../../services/auth.dart';

class IntermitttentFastingSelectPlanView extends StatelessWidget {
  const IntermitttentFastingSelectPlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          height: 50,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ColorManager.primary,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.intermittentFastingPlans);
                },
              ),
              Container()
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Intermittent Fasting",
            style: TextStyle(color: ColorManager.primary),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.star_outline),
              onPressed: () {},
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(ImageAssets.dietsBackground),
                fit: BoxFit.fill,
              )),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              height: 1000,
              width: double.maxFinite,
              child: ListView(
                children: [
                  SizedBox(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppStrings.selectIntermittentFastingPlan,
                        style: getApplicationTheme()
                            .textTheme
                            .headline3!
                            .copyWith(color: ColorManager.primary),
                      ),
                    ),
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.timeRestrictedEating,
                    isTitle: true,
                  ),
                  IntermittentFastingImageButtonWidget(
                    image: ImageAssets.timeRestricted,
                    path: "path",
                    activeUserId: authService.activeUserId,
                    diet: "Time Restricted Diet",
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.fiveTwoMethod,
                    isTitle: true,
                  ),
                  IntermittentFastingImageButtonWidget(
                    image: ImageAssets.fiveTwoDiet,
                    path: "path",
                    activeUserId: authService.activeUserId,
                    diet: "Five Two Diet",
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.eatStopEatMethod,
                    isTitle: true,
                  ),
                  IntermittentFastingImageButtonWidget(
                    image: ImageAssets.eatStopEatDiet,
                    path: "path",
                    activeUserId: authService.activeUserId,
                    diet: "Eat Stop Eat Diet",
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.alternateDayFasting,
                    isTitle: true,
                  ),
                  IntermittentFastingImageButtonWidget(
                    image: ImageAssets.alternateFastingDiet,
                    path: "path",
                    activeUserId: authService.activeUserId,
                    diet: "Alternate Day Fasting",
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.warriorsDiet,
                    isTitle: true,
                  ),
                  IntermittentFastingImageButtonWidget(
                    image: ImageAssets.warriorDiet,
                    path: "path",
                    activeUserId: authService.activeUserId,
                    diet: "Warrior Diet",
                  ),
                  const SizedBox(
                    height: AppSize.s100,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
