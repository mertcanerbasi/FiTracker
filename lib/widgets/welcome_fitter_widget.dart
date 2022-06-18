// ignore_for_file: avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/strings_manager.dart';
import 'package:fitness_app/managers/values_manager.dart';
import 'package:flutter/material.dart';

class WelcomeFitterWidget extends StatelessWidget {
  const WelcomeFitterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return Container(
      margin: const EdgeInsets.only(top: AppMargin.m20, bottom: AppMargin.m20),
      height: AppSize.s60,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          flex: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                (now.hour >= 5 && now.hour < 12)
                    ? AppStrings.goodMorning
                    : (now.hour >= 12 && now.hour < 18)
                        ? AppStrings.goodAfternoon
                        : AppStrings.goodEvening,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.black),
                minFontSize: 10,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              AutoSizeText(
                AppStrings.youAreOn168Plan,
                style: TextStyle(fontSize: 20, color: ColorManager.grey1),
                minFontSize: 10,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                print("edit");
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSize.s1_5),
                    child: Icon(
                      Icons.edit,
                      color: ColorManager.primary,
                    ),
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}
