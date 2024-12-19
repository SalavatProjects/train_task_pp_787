import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pp_787/navigation/routes.dart';

import '../gen/assets.gen.dart';
import '../ui_kit/app_colors.dart';
import '../ui_kit/app_styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset(Assets.icons.chevronLeft),
                      ),
                    ),
                    const SizedBox(width: 6,),
                    const Text('Positivity anchors', style: AppStyles.displaySmall,),
                  ],
                ),
                const SizedBox(height: 32,),
                Center(
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _SettingsCardBtn(
                          imagePath: Assets.images.shareAppYellow.path,
                          text: 'Share app',
                          onTap: () {}),
                      _SettingsCardBtn(
                          imagePath: Assets.images.feedback.path,
                          text: 'Feedback',
                          onTap: () {}),
                      _SettingsCardBtn(
                          imagePath: Assets.images.aboutUs.path,
                          text: 'About us',
                          onTap: () => Navigator.of(context).pushNamed(AppRoutes.aboutUs)),
                      _SettingsCardBtn(
                          imagePath: Assets.images.version.path,
                          text: 'Version',
                          onTap: () {}),
                      _SettingsCardBtn(
                          imagePath: Assets.images.termsOfUse.path,
                          text: 'Terms of use',
                          onTap: () {}),
                      _SettingsCardBtn(
                          imagePath: Assets.images.privacyPolicy.path,
                          text: 'Privacy policy',
                          onTap: () {}),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class _SettingsCardBtn extends StatelessWidget {
  final String imagePath;
  final String text;
  void Function() onTap;

  _SettingsCardBtn({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: (MediaQuery.of(context).size.width - 48) / 2,
            height: (MediaQuery.of(context).size.width - 48) / 2,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: AppColors.surface,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 4)
                  )
                ]
            ),
            child: Image.asset(imagePath),
          ),
        ),
        const SizedBox(height: 8,),
        Text(text, style: AppStyles.bodyMedium, textAlign: TextAlign.center,)
      ],
    );
  }
}