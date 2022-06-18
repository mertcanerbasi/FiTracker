// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../managers/color_manager.dart';
import '../managers/values_manager.dart';

class ScheduleDayWidget extends StatelessWidget {
  String day;
  ScheduleDayWidget({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s12),
              border: Border.all(color: ColorManager.primary),
            ),
            child: Center(
                child: AutoSizeText(
              day,
              style: TextStyle(fontSize: 20, color: ColorManager.primary),
              minFontSize: 10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    ));
  }
}
