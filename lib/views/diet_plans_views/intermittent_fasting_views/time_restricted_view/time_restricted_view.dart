import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/values_manager.dart';
import 'package:fitness_app/widgets/fasting_schedule_widget.dart';
import 'package:fitness_app/widgets/fasting_tracker_widget.dart';
import 'package:fitness_app/widgets/fasting_water_reminder_widget.dart';
import 'package:fitness_app/widgets/fasting_weight_control_widget.dart';
import 'package:fitness_app/widgets/welcome_fitter_widget.dart';
import 'package:flutter/material.dart';

class TimeRestrictedView extends StatelessWidget {
  const TimeRestrictedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorManager.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: ListView(
            children: const [
              WelcomeFitterWidget(),
              FastingTrackerWidget(),
              FastingScheduleWidget(),
              FastingWaterReminderWidget(),
              FastingWeightControlWidget(),
            ],
          ),
        ));
  }
}
