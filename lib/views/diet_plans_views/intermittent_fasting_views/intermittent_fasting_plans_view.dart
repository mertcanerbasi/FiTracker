import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/strings_manager.dart';
import 'package:fitness_app/managers/theme_manager.dart';
import 'package:fitness_app/widgets/intermittent_fasting_text_widget.dart';
import 'package:flutter/material.dart';
import '../../../managers/assets_manager.dart';
import '../../../managers/routes_manager.dart';
import '../../../managers/values_manager.dart';

class IntermitttentFastingPlansView extends StatelessWidget {
  const IntermitttentFastingPlansView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      context, Routes.intermittentFasting);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManager.primary,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.intermittentFastingSelectPlan);
                },
              )
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
                    child: Text(
                      AppStrings.methods,
                      style: getApplicationTheme()
                          .textTheme
                          .headline3!
                          .copyWith(color: ColorManager.primary),
                    ),
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.timeRestrictedEating,
                    isTitle: true,
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.timeRestrictedEatingDescription,
                    isTitle: false,
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.fiveTwoMethod,
                    isTitle: true,
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.fiveTwoMethodDescription,
                    isTitle: false,
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.eatStopEatMethod,
                    isTitle: true,
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.eatStopEatMethodDescription,
                    isTitle: false,
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.alternateDayFasting,
                    isTitle: true,
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.alternateDayFastingDescription,
                    isTitle: false,
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.warriorsDiet,
                    isTitle: true,
                  ),
                  IntermittentFastingTextWidget(
                    text: AppStrings.warriorsDietDescription,
                    isTitle: false,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
