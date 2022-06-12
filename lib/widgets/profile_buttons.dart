// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../managers/color_manager.dart';
import '../managers/values_manager.dart';

class ProfileButtons extends StatelessWidget {
  String buttonText;
  IconData buttonIcon;
  String routeName;
  ProfileButtons(
      {Key? key,
      required this.buttonText,
      required this.buttonIcon,
      required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: AppSize.s12,
                ),
                Icon(
                  buttonIcon,
                  color: ColorManager.primary,
                  size: AppSize.s40,
                ),
                const SizedBox(
                  width: AppSize.s12,
                ),
                Text(
                  buttonText,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: AppSize.s20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
