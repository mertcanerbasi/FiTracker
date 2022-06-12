import 'package:fitness_app/managers/color_manager.dart';
import 'package:flutter/material.dart';
import '../managers/theme_manager.dart';

class ImageTextsWidget extends StatelessWidget {
  final String image;
  final String title;
  final String path;
  const ImageTextsWidget(
      {Key? key, required this.image, required this.title, required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, path);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  title,
                  style: getApplicationTheme()
                      .textTheme
                      .headline1!
                      .copyWith(color: ColorManager.white),
                )),
          ),
        ));
  }
}
