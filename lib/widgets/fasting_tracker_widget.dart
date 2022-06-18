import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../managers/strings_manager.dart';

class FastingTrackerWidget extends StatelessWidget {
  const FastingTrackerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m20),
      height: AppSize.s120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12),
        //border: Border.all(color: Colors.red),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: FittedBox(
              child: CircularPercentIndicator(
                startAngle: 270,
                radius: 130.0,
                animation: true,
                animationDuration: 600,
                lineWidth: 20.0,
                percent: 0.0,
                center: Icon(
                  Icons.hourglass_bottom_outlined,
                  color: ColorManager.black,
                  size: 40,
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: ColorManager.grey1.withOpacity(0.1),
                progressColor: ColorManager.primary,
              ),
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: AutoSizeText(
                    AppStrings.nextFast,
                    style: TextStyle(fontSize: 15, color: ColorManager.grey1),
                    minFontSize: 10,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: AutoSizeText(
                    "9:00 PM",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.black),
                    minFontSize: 10,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: AppSize.s10),
                GestureDetector(
                  onTap: () {
                    print("Start Fastirng");
                  },
                  child: Container(
                    height: AppSize.s40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        color: ColorManager.primary),
                    child: Center(
                      child: AutoSizeText(
                        AppStrings.startFasting,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.white),
                        minFontSize: 10,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
