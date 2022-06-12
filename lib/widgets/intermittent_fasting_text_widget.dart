// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../managers/color_manager.dart';
import '../managers/theme_manager.dart';
import '../managers/values_manager.dart';

class IntermittentFastingTextWidget extends StatelessWidget {
  bool isTitle;
  String text;
  IntermittentFastingTextWidget(
      {Key? key, required this.isTitle, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isTitle
        ? Column(
            children: [
              const SizedBox(
                height: AppSize.s20,
              ),
              SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    text,
                    style: getApplicationTheme()
                        .textTheme
                        .caption!
                        .copyWith(color: ColorManager.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          )
        : Column(
            children: [
              const SizedBox(
                height: AppSize.s20,
              ),
              SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    text,
                    style: getApplicationTheme()
                        .textTheme
                        .caption!
                        .copyWith(color: ColorManager.white),
                  ),
                ),
              ),
            ],
          );
  }
}
