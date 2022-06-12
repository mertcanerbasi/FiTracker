import 'package:flutter/material.dart';
import '../../managers/strings_manager.dart';
import '../../managers/values_manager.dart';
import '../../widgets/settings_listtile_widgets.dart';

class ProfileSettingsView extends StatefulWidget {
  const ProfileSettingsView({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsView> createState() => _ProfileSettingsViewState();
}

class _ProfileSettingsViewState extends State<ProfileSettingsView> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SettingsListTileWidgets(
              icon: Icons.change_circle_outlined,
              buttonText: AppStrings.resetExcersisesSettings,
            ),
            const Spacer(
              flex: 1,
            ),
            SettingsListTileWidgets(
              icon: Icons.change_circle_outlined,
              buttonText: AppStrings.resetExcersisesSettings,
            ),
            const Spacer(
              flex: 1,
            ),
            SettingsListTileWidgets(
              icon: Icons.change_circle_outlined,
              buttonText: AppStrings.resetExcersisesSettings,
            ),
            const Spacer(
              flex: 1,
            ),
            SettingsListTileWidgets(
              icon: Icons.change_circle_outlined,
              buttonText: AppStrings.resetExcersisesSettings,
            ),
            const Spacer(
              flex: 1,
            ),
            SettingsListTileWidgets(
              icon: Icons.change_circle_outlined,
              buttonText: AppStrings.resetExcersisesSettings,
            ),
            const Spacer(
              flex: 1,
            ),
            SettingsListTileWidgets(
              icon: Icons.change_circle_outlined,
              buttonText: AppStrings.resetExcersisesSettings,
            ),
            const Spacer(
              flex: 1,
            ),
            SettingsListTileWidgets(
              icon: Icons.change_circle_outlined,
              buttonText: AppStrings.resetExcersisesSettings,
            ),
            const Spacer(
              flex: 1,
            ),
            SettingsListTileWidgets(
              icon: Icons.change_circle_outlined,
              buttonText: AppStrings.resetExcersisesSettings,
            ),
            const Spacer(
              flex: 1,
            ),
            SettingsListTileWidgets(
              icon: Icons.change_circle_outlined,
              buttonText: AppStrings.resetExcersisesSettings,
            ),
          ],
        ),
      ),
    );
  }
}
