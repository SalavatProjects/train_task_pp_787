import 'dart:ui';

import 'package:pp_787/ui_kit/app_colors.dart';

import '../gen/assets.gen.dart';

abstract class AppConstants {
  static const isFirstRun = 'isFirstRun';
  static const duration200 = Duration(milliseconds: 200);
  static final List<String> customEmotions = [
    Assets.images.trianglesYellow.path, Assets.images.squaresYellow.path, Assets.images.circlesYellow.path, Assets.images.formlessYellow.path,
    Assets.images.trianglesRed.path, Assets.images.squaresRed.path, Assets.images.circlesRed.path, Assets.images.formlessRed.path,
    Assets.images.trianglesBlue.path, Assets.images.squaresBlue.path, Assets.images.circlesBlue.path, Assets.images.formlessBlue.path,
  ];
  static final preMadeEmotions = <(String imagePath, String name)>[
    (Assets.images.affection.path, 'Affection'),
    (Assets.images.hope.path, 'Hope'),
    (Assets.images.joy.path, 'Joy'),
    (Assets.images.boredom.path, 'Boredom'),
    (Assets.images.balance.path, 'Balance'),
    (Assets.images.sadness.path, 'Sadness'),
    (Assets.images.confusion.path, 'Confusion'),
    (Assets.images.anxiety.path, 'Anxiety'),
    (Assets.images.meloncholy.path, 'Meloncholia'),
    (Assets.images.irritation.path, 'Irritation'),
    (Assets.images.anger.path, 'Anger'),
    (Assets.images.tension.path, 'Tension'),
  ];
  static final generalFeelings = <(String imagePath, String name, Color color, int generallyFeeling)>[
    (Assets.images.generalFeelingPositive.path, 'Positive', AppColors.orange, 1),
    (Assets.images.generalFeelingNeutral.path, 'Neutral', AppColors.gray, 2),
    (Assets.images.generalFeelingNegative.path, 'Negative', AppColors.primary, 3),
  ];
}