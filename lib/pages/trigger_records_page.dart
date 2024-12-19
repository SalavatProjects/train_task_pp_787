import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pp_787/bloc/trigger_state.dart';
import 'package:pp_787/navigation/routes.dart';
import 'package:pp_787/utils/constants.dart';
import 'dart:math';
import 'dart:collection';

import '../bloc/moods_bloc.dart';
import '../gen/assets.gen.dart';
import '../ui_kit/app_colors.dart';
import '../ui_kit/app_styles.dart';

class TriggerRecordsPage extends StatelessWidget {
  int triggerId;

  TriggerRecordsPage({
    super.key,
    required this.triggerId
  });

  @override
  Widget build(BuildContext context) {

    Map<String, int> _getValuesCount(List valuesList) {
      int count = 0;
      Map<String, int> result = {};
      List<String> uniqueList = LinkedHashSet<String>.from(valuesList).toList();
      for (var searchedElem in uniqueList) {
        for (var elem in valuesList) {
          if (searchedElem == elem) {
            count++;
          }
        }
        result[searchedElem] = count;
        count = 0;
      }
      return result;
    }

    int _getMaxElement(List valuesList) {
      int count = 0;
      List<int> counts = [];
      for (var searchedElem in valuesList) {
        for (var elem in valuesList) {
          if (searchedElem == elem) {
            count++;
          }
        }
        counts.add(count);
        count = 0;
      }
      return counts.reduce(max);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocSelector<MoodsBloc, MoodsState, List<TriggerState>>(
            selector: (state) => state.triggers,
            builder: (context, triggers) {
              TriggerState trigger = triggers.where((e) => e.id == triggerId).first;
              int maxCountIcons = 0;
              Map<String, int> iconsCount = {};
              List<String> uniqueIcons = [];
              if(trigger.iconsPath.isNotEmpty) {
                maxCountIcons = _getMaxElement(trigger.iconsPath);
                iconsCount = _getValuesCount(trigger.iconsPath);
                uniqueIcons = LinkedHashSet<String>.from(trigger.iconsPath).toList();
              }
              return Column(
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
                  const Text(
                    'Emotional trigger map', style: AppStyles.displaySmall,)
                ],
              ),
              const SizedBox(height: 32,),
              if (trigger.iconsPath.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trigger.name!, style: AppStyles.displayLarge,),
                    const SizedBox(height: 32,),
                    ...List.generate(
                        uniqueIcons.length,
                            (index) {
                          String name = AppConstants.preMadeEmotions.where((e) => e.$1 == uniqueIcons[index]).first.$2;
                          return Row(
                            children: [
                              SizedBox(
                                width: 74,
                                height: 82,
                                child: Column(
                                  children: [
                                    SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: Image.asset(uniqueIcons[index])),
                                    Center(
                                        child: Text(name, style: AppStyles.bodyMedium)
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16,),
                              Container(
                                width: (MediaQuery.of(context).size.width - 165) * iconsCount[uniqueIcons[index]]!/maxCountIcons,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: AppColors.primary
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              const SizedBox(width: 16,),
                              SizedBox(
                                width: 25,
                                child: Text(iconsCount[uniqueIcons[index]]!.toString(), style: AppStyles.displayLarge,),
                              )
                            ],
                          );
                        }),
                    const SizedBox(height: 32,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Opacity(
                        opacity: 1,
                        child: CupertinoButton(
                            color: AppColors.secondary,
                            disabledColor: AppColors.secondary,
                            borderRadius: BorderRadius.circular(64),
                            onPressed: () {
                              Navigator.of(context).pushNamed(AppRoutes.triggerEmotions, arguments: trigger);
                            },
                            child: const Text('New emotion in the trigger', style: AppStyles.bodyMedium,)),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Opacity(
                        opacity: 1,
                        child: CupertinoButton(
                            color: AppColors.destructive,
                            disabledColor: AppColors.destructive,
                            borderRadius: BorderRadius.circular(64),
                            onPressed: () {
                              context.read<MoodsBloc>().deleteTrigger(trigger.id!);
                              Navigator.of(context).pop();
                            },
                            child: Text('Delete trigger', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                      ),
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('No records in this trigger yet', style: AppStyles.displayLarge),
                    const SizedBox(height: 32,),
                    Image.asset(Assets.images.noRecordsInTrigger.path),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Opacity(
                        opacity: 1,
                        child: CupertinoButton(
                            color: AppColors.primary,
                            disabledColor: AppColors.primary,
                            borderRadius: BorderRadius.circular(64),
                            onPressed: () {
                              Navigator.of(context).pushNamed(AppRoutes.triggerEmotions, arguments: trigger);
                            },
                            child: Text('New emotion in the trigger', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                      ),
                    ),
                  ],
                )
            ],
          );
  },
),
        ),
      ),
    );
  }
}
