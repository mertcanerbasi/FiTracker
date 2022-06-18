// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_final_fields

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../managers/strings_manager.dart';
import '../services/auth.dart';

class FastingWeightControlWidget extends StatefulWidget {
  const FastingWeightControlWidget({Key? key}) : super(key: key);

  @override
  State<FastingWeightControlWidget> createState() =>
      _FastingWeightControlWidgetState();
}

class _FastingWeightControlWidgetState
    extends State<FastingWeightControlWidget> {
  double weightGoal = 0;
  TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m20),
      height: AppSize.s100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s12),
          border: Border.all(color: ColorManager.primary, width: AppSize.s1)),
      child: weightGoal == 0
          ? GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => AlertDialog(
                          title: const Text(AppStrings.enterYourWeightGoal),
                          content: TextField(
                            controller: _weightController,
                            keyboardType: TextInputType.number,
                          ),
                          actions: [
                            TextButton(
                              child: Text(
                                "OK",
                                style: TextStyle(color: ColorManager.primary),
                              ),
                              onPressed: () {
                                (_weightController.text != "" &&
                                        double.parse(_weightController.text) >
                                            0)
                                    ? setState(() {
                                        weightGoal = double.parse(
                                            _weightController.text);
                                      })
                                    : null;
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "Add your weight goal",
                      style: TextStyle(fontSize: 15, color: ColorManager.grey1),
                      minFontSize: 10,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  const Center(
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            )
          : Container(
              margin: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "Weight goal",
                      style: TextStyle(fontSize: 15, color: ColorManager.grey1),
                      minFontSize: 10,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Center(
                    child: LinearPercentIndicator(
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2000,
                      percent: weightGoal /
                          double.parse(
                              authService.activeUser!.weight.toString()),
                      center: Text(
                        ((weightGoal /
                                        double.parse(authService
                                            .activeUser!.weight!
                                            .toString())) *
                                    100)
                                .toStringAsFixed(2)
                                .toString() +
                            " %",
                        style: TextStyle(color: ColorManager.black),
                      ),
                      barRadius: const Radius.circular(20),
                      progressColor: ColorManager.primary,
                      backgroundColor: ColorManager.grey1.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
