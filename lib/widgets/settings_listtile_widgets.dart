// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../managers/color_manager.dart';
import '../managers/theme_manager.dart';
import '../managers/values_manager.dart';

class SettingsListTileWidgets extends StatelessWidget {
  IconData icon;
  String buttonText;
  SettingsListTileWidgets(
      {Key? key, required this.icon, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppPadding.p20),
          border: Border.all(
            color: ColorManager.black,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(width: AppSize.s20),
              FittedBox(
                child: Text(buttonText,
                    style: getApplicationTheme().textTheme.headline2!.copyWith(
                          color: ColorManager.black,
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
