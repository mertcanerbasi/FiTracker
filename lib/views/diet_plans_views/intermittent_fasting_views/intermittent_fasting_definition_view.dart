import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/strings_manager.dart';
import 'package:fitness_app/managers/theme_manager.dart';
import 'package:flutter/material.dart';
import '../../../managers/assets_manager.dart';
import '../../../managers/values_manager.dart';

class IntermitttentFastingDefinitionView extends StatelessWidget {
  const IntermitttentFastingDefinitionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
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
                      AppStrings.whatIsIt,
                      style: getApplicationTheme()
                          .textTheme
                          .headline3!
                          .copyWith(color: ColorManager.primary),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  SizedBox(
                    child: Text(
                      AppStrings.definitionOfIntermittentFasting,
                      style: getApplicationTheme()
                          .textTheme
                          .caption!
                          .copyWith(color: ColorManager.white),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  SizedBox(
                    child: Text(
                      AppStrings.howDoesItWork,
                      style: getApplicationTheme()
                          .textTheme
                          .headline3!
                          .copyWith(color: ColorManager.primary),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  SizedBox(
                    child: Text(
                      AppStrings.howDoesIntermittentFastingWorks,
                      style: getApplicationTheme()
                          .textTheme
                          .caption!
                          .copyWith(color: ColorManager.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
