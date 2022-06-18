import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/routes_manager.dart';
import 'package:fitness_app/managers/values_manager.dart';
import 'package:fitness_app/views/diet_plans_views/intermittent_fasting_views/time_restricted_view/time_restricted_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../managers/assets_manager.dart';
import '../../services/auth.dart';
import '../../widgets/image_text_widget.dart';

class DietPlansView extends StatelessWidget {
  const DietPlansView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return authService.activeUser!.selectedDiet == ""
        ? Scaffold(
            backgroundColor: ColorManager.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: SizedBox(
                height: 1000,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 1000,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Spacer(
                            flex: 1,
                          ),
                          ImageTextsWidget(
                            image: ImageAssets.intermittentFasting,
                            title: 'Intermittent Fasting',
                            path: Routes.intermittentFasting,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          ImageTextsWidget(
                            image: ImageAssets.mediterrianDiet,
                            title: 'Mediterrian Diet',
                            path: Routes.mediterrianDiet,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          ImageTextsWidget(
                            image: ImageAssets.ketogenicDiet,
                            title: 'Ketogenic Diet',
                            path: Routes.ketogenicDiet,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          ImageTextsWidget(
                            image: ImageAssets.veganismDiet,
                            title: 'Vegan Diet',
                            path: Routes.veganDiet,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          ImageTextsWidget(
                            image: ImageAssets.carnivoreDiet,
                            title: 'Carnivore Diet',
                            path: Routes.carnivoreDiet,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          ImageTextsWidget(
                            image: ImageAssets.paleoDiet,
                            title: 'Paleo Diet',
                            path: Routes.paleoDiet,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : authService.activeUser!.selectedDiet == "Time Restricted Diet"
            ? const TimeRestrictedView()
            : Scaffold(
                backgroundColor: ColorManager.white,
              );
  }
}
