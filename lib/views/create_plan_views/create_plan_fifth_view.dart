import 'package:fitness_app/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

import '../../managers/assets_manager.dart';
import '../../managers/color_manager.dart';
import '../../managers/routes_manager.dart';
import '../../managers/strings_manager.dart';
import '../../managers/values_manager.dart';
import '../../services/auth.dart';

class CreatePlanFifthView extends StatefulWidget {
  const CreatePlanFifthView({Key? key}) : super(key: key);

  @override
  State<CreatePlanFifthView> createState() => _CreatePlanFifthViewState();
}

class _CreatePlanFifthViewState extends State<CreatePlanFifthView> {
  int _currentAge = 20;
  int _currentWeight = 70;
  int _currentHeight = 170;
  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(ImageAssets.createPlan),
                fit: BoxFit.fill,
              )),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      AppStrings.enterYourMeasure,
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Divider(
                    color: ColorManager.primary,
                    thickness: 2,
                    height: 0,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s20),
                                  ),
                                  child: Center(
                                      child: Text(
                                    AppStrings.age,
                                    style: Theme.of(context).textTheme.button,
                                  )),
                                ),
                              ),
                              const Spacer(flex: 1),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s20),
                                  ),
                                  child: NumberPicker(
                                    itemHeight: 30,
                                    zeroPad: false,
                                    textStyle:
                                        Theme.of(context).textTheme.button,
                                    selectedTextStyle:
                                        Theme.of(context).textTheme.headline2,
                                    haptics: false,
                                    value: _currentAge,
                                    minValue: 0,
                                    maxValue: 100,
                                    onChanged: (value) =>
                                        setState(() => _currentAge = value),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s20),
                                  ),
                                  child: Center(
                                      child: Text(
                                    AppStrings.weight,
                                    style: Theme.of(context).textTheme.button,
                                  )),
                                ),
                              ),
                              const Spacer(flex: 1),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s20),
                                  ),
                                  child: NumberPicker(
                                    zeroPad: false,
                                    itemHeight: 30,
                                    textStyle:
                                        Theme.of(context).textTheme.button,
                                    selectedTextStyle:
                                        Theme.of(context).textTheme.headline2,
                                    haptics: false,
                                    value: _currentWeight,
                                    minValue: 0,
                                    maxValue: 100,
                                    onChanged: (value) =>
                                        setState(() => _currentWeight = value),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s20),
                                  ),
                                  child: Center(
                                      child: Text(
                                    AppStrings.height,
                                    style: Theme.of(context).textTheme.button,
                                  )),
                                ),
                              ),
                              const Spacer(flex: 1),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s20),
                                  ),
                                  child: NumberPicker(
                                    zeroPad: false,
                                    textStyle:
                                        Theme.of(context).textTheme.button,
                                    selectedTextStyle:
                                        Theme.of(context).textTheme.headline2,
                                    itemHeight: 30,
                                    haptics: false,
                                    value: _currentHeight,
                                    minValue: 0,
                                    maxValue: 230,
                                    onChanged: (value) =>
                                        setState(() => _currentHeight = value),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () async {
                        await FireStoreService().updateAge(
                            _authService.activeUserId,
                            age: _currentAge);
                        await FireStoreService().updateWeight(
                            _authService.activeUserId,
                            weight: _currentWeight);
                        await FireStoreService().updateHeight(
                            _authService.activeUserId,
                            height: _currentHeight);
                        await FireStoreService().updateProgramCreated(
                            _authService.activeUserId,
                            programCreated: true);
                        Navigator.pushNamedAndRemoveUntil(context,
                            Routes.navigation, (Route<dynamic> route) => false);
                      },
                      child: Container(
                        alignment: Alignment.topLeft,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(AppSize.s20),
                        ),
                        child: Center(
                            child: Text(
                          AppStrings.createPlan,
                          style: Theme.of(context).textTheme.button,
                        )),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
