// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:fitness_app/managers/routes_manager.dart';
import 'package:flutter/material.dart';
import '../managers/values_manager.dart';
import '../services/firestore_service.dart';

class IntermittentFastingImageButtonWidget extends StatelessWidget {
  String image;
  String path;
  dynamic activeUserId;
  String diet;
  IntermittentFastingImageButtonWidget(
      {Key? key,
      required this.image,
      required this.path,
      required this.activeUserId,
      required this.diet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s20,
        ),
        GestureDetector(
          onTap: () async {
            await FireStoreService()
                .updateSelectedDiet(activeUserId, selectedDiet: diet);
            Navigator.pushNamed(context, Routes.navigation);
          },
          child: Container(
            height: AppSize.s100,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
