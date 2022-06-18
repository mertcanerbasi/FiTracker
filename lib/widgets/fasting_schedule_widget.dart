import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/values_manager.dart';
import 'package:fitness_app/widgets/schedule_day_widget.dart';
import 'package:flutter/material.dart';

import '../managers/strings_manager.dart';

class FastingScheduleWidget extends StatelessWidget {
  const FastingScheduleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m20),
      height: AppSize.s100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12),
        border: Border.all(color: ColorManager.primary),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: AppMargin.m16, horizontal: AppMargin.m20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      AppStrings.mySchedule,
                      style: TextStyle(fontSize: 20, color: ColorManager.black),
                      minFontSize: 10,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AutoSizeText(
                      AppStrings.sevenDaysAWeek,
                      style: TextStyle(fontSize: 20, color: ColorManager.grey1),
                      minFontSize: 10,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )),
            const Spacer(
              flex: 1,
            ),
            Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ScheduleDayWidget(
                      day: "M",
                    ),
                    ScheduleDayWidget(
                      day: "T",
                    ),
                    ScheduleDayWidget(
                      day: "W",
                    ),
                    ScheduleDayWidget(
                      day: "T",
                    ),
                    ScheduleDayWidget(
                      day: "F",
                    ),
                    ScheduleDayWidget(
                      day: "S",
                    ),
                    ScheduleDayWidget(
                      day: "S",
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
