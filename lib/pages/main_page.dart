import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_787/bloc/mood_state.dart';
import 'package:pp_787/bloc/moods_bloc.dart';
import 'package:pp_787/main.dart';
import 'package:pp_787/navigation/routes.dart';
import 'package:pp_787/ui_kit/app_colors.dart';
import 'package:pp_787/ui_kit/app_styles.dart';
import 'package:pp_787/utils/constants.dart';

import '../gen/assets.gen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  final double _padding = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(_padding, _padding, _padding, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Your wellbeing this month', style: AppStyles.displaySmall,),
                const SizedBox(height: 16,),
                BlocSelector<MoodsBloc, MoodsState, List<MoodState>>(
                  selector: (state) => state.moods,
                  builder: (context, moods) {
                    final now = DateUtils.dateOnly(DateTime.now());
                    final start = now.copyWith(day: 1);
                    final List<MoodState> currentMonthMoods = moods.where((e) => (!e.date!.isBefore(start) && e.date!.isBefore(start.copyWith(month: start.month + 1)))).toList();
                    if (currentMonthMoods.isNotEmpty) {
                      final int positiveMoods = currentMonthMoods.where((e) => (e.generallyFeeling == AppConstants.generalFeelings[0].$4)).length;
                      final int neutralMoods = positiveMoods + currentMonthMoods.where((e) => e.generallyFeeling == AppConstants.generalFeelings[1].$4).length;

                      final neutralMoodsWidth = MediaQuery.of(context).size.width * (neutralMoods / currentMonthMoods.length) - _padding < 0 ?
                      MediaQuery.of(context).size.width * (neutralMoods / currentMonthMoods.length) :
                      MediaQuery.of(context).size.width * (neutralMoods / currentMonthMoods.length) - _padding;

                      final positiveMoodsWidth = MediaQuery.of(context).size.width * (positiveMoods / currentMonthMoods.length) - _padding < 0 ?
                      MediaQuery.of(context).size.width * (positiveMoods / currentMonthMoods.length) :
                      MediaQuery.of(context).size.width * (positiveMoods / currentMonthMoods.length) - _padding;
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 36,
                            color: AppColors.blue,
                            child: Stack(
                              children: [
                                Container(
                                  width: neutralMoodsWidth,
                                  color: AppColors.gray,
                                ),
                                Container(
                                  width: positiveMoodsWidth,
                                  color: AppColors.orange,
                                )
                              ],
                            )
                        ),
                      );
                    } else {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            image: DecorationImage(image: AssetImage(Assets.images.noDataYet.path), fit: BoxFit.fill)
                        ),
                        child: const Center(child: Text('No data yet', style: AppStyles.bodyMedium,)),
                      );
                    }
                  },
                ),
                const SizedBox(height: 32,),
              ],
            ),
          ),

            Center(
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _MainCardBtn(
                          imagePath: Assets.images.checkIn.path,
                          text: 'Check in',
                          onTap: () => Navigator.of(context).pushNamed(AppRoutes.checkIn),
                        ),
                  _MainCardBtn(
                      imagePath: Assets.images.timeline.path,
                      text: 'Timeline',
                      onTap: () => Navigator.of(context).pushNamed(AppRoutes.timeline),
                  ),
                  _MainCardBtn(
                      imagePath: Assets.images.triggerMap.path,
                      text: 'Trigger map',
                      onTap: () => Navigator.of(context).pushNamed(AppRoutes.trigger),
                  ),
                  _MainCardBtn(
                    imagePath: Assets.images.reflection.path,
                    text: 'Reflection',
                    onTap: () => Navigator.of(context).pushNamed(AppRoutes.reflection),
                  ),
                  _MainCardBtn(
                      imagePath: Assets.images.positivityAnchors.path,
                      text: 'Positivity anchors',
                      onTap: () {}
                  ),
                  _MainCardBtn(
                    imagePath: Assets.images.settings.path,
                    text: 'Settings',
                    onTap: () {},
                  ),
                ],
              ),
            )
        ],
      )),
    );
  }
}

class _MainCardBtn extends StatelessWidget {
  final String imagePath;
  final String text;
  void Function() onTap;

  _MainCardBtn({
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

