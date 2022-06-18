import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/strings_manager.dart';
import 'package:fitness_app/managers/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FastingWaterReminderWidget extends StatefulWidget {
  const FastingWaterReminderWidget({Key? key}) : super(key: key);

  @override
  State<FastingWaterReminderWidget> createState() =>
      _FastingWaterReminderWidgetState();
}

class _FastingWaterReminderWidgetState
    extends State<FastingWaterReminderWidget> {
  double waterCounter = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m20),
      height: AppSize.s120,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: FittedBox(
              child: CircularPercentIndicator(
                curve: Curves.easeInSine,
                startAngle: 270,
                radius: 130.0,
                animation: true,
                animationDuration: 600,
                lineWidth: 20.0,
                percent: (waterCounter / 3.5),
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      "${waterCounter}/3.5 ltr",
                      style: TextStyle(fontSize: 30, color: ColorManager.grey1),
                      minFontSize: 10,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: AppSize.s10,
                    ),
                    const Icon(
                      Icons.water_drop,
                      color: Colors.blueAccent,
                      size: 50,
                    ),
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: ColorManager.grey1.withOpacity(0.1),
                progressColor: Colors.blueAccent,
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
                    AppStrings.waterReminder,
                    style: TextStyle(fontSize: 15, color: ColorManager.grey1),
                    minFontSize: 10,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: AutoSizeText(
                    waterCounter.toString(),
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
                SizedBox(
                  height: AppSize.s40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (waterCounter > 0) {
                              waterCounter = waterCounter - 0.5;
                            }
                          });
                        },
                        child: Container(
                          height: AppSize.s40,
                          width: AppSize.s40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s100),
                              color: ColorManager.primary),
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              color: ColorManager.white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (waterCounter < 3.5) {
                              waterCounter = waterCounter + 0.5;
                            }
                          });
                        },
                        child: Container(
                          height: AppSize.s40,
                          width: AppSize.s40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s100),
                              color: ColorManager.primary),
                          child: Icon(
                            Icons.add,
                            color: ColorManager.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
