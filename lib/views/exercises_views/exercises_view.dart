import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/routes_manager.dart';
import 'package:fitness_app/managers/values_manager.dart';
import 'package:flutter/material.dart';
import '../../managers/assets_manager.dart';
import '../../widgets/image_text_widget.dart';

class ExercisesView extends StatelessWidget {
  const ExercisesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(
              flex: 1,
            ),
            ImageTextsWidget(
              image: ImageAssets.swimming,
              title: 'Swimming',
              path: Routes.swimming,
            ),
            Spacer(
              flex: 1,
            ),
            ImageTextsWidget(
              image: ImageAssets.running,
              title: 'Running',
              path: Routes.running,
            ),
            Spacer(
              flex: 1,
            ),
            ImageTextsWidget(
              image: ImageAssets.fitness,
              title: 'Fitness',
              path: Routes.fitness,
            ),
            Spacer(
              flex: 1,
            ),
            ImageTextsWidget(
              image: ImageAssets.cycling,
              title: 'Cycling',
              path: Routes.cycling,
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
