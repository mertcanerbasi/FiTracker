import 'package:flutter/material.dart';

import '../managers/color_manager.dart';
import '../managers/font_manager.dart';
import '../managers/styles_manager.dart';
import '../managers/values_manager.dart';

class CommonButton extends StatelessWidget {
  String buttonText;
  double fontSize;
  double height;
  Color buttonColor;
  CommonButton(
      {Key? key,
      required this.buttonText,
      required this.fontSize,
      required this.height,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: Center(
        child: Text(
          buttonText,
          style:
              getBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
        ),
      ),
    );
  }
}
