import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pp_787/bloc/trigger_state.dart';
import 'package:pp_787/navigation/routes.dart';

import '../bloc/moods_bloc.dart';
import '../gen/assets.gen.dart';
import '../ui_kit/app_colors.dart';
import '../ui_kit/app_styles.dart';

class TriggerPage extends StatelessWidget {
  const TriggerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
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
          ),
          const SizedBox(height: 32,),
          BlocSelector<MoodsBloc, MoodsState, List<TriggerState>>(
            selector: (state) => state.triggers,
            builder: (context, triggers) {
              if (triggers.isEmpty)
                {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('No triggers yet', style: AppStyles.displayLarge,),
                        const SizedBox(height: 32,),
                        Image.asset(Assets.images.noTriggersYet.path),
                        const SizedBox(height: 32,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Opacity(
                        opacity: 1,
                        child: CupertinoButton(
                            color: AppColors.primary,
                            disabledColor: AppColors.primary,
                            borderRadius: BorderRadius.circular(64),
                            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.createTriggerName),
                            child: Text('Next', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                      ),
                    ),
                      ],
                    ),
                  );
                } else {
                return Column(
                  children: <Widget>[
                    ...List.generate(triggers.length, (index) {
                      List<String> uniqueIconPaths = LinkedHashSet<String>.from(triggers[index].iconsPath).toList();
                      return Column(
                        children: <Widget>[
                          const Divider(height: 1, color: AppColors.secondary,),
                          const SizedBox(height: 8,),
                          SizedBox(
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(32, 0, 16, 0),
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  Navigator.of(context).pushNamed(AppRoutes.triggerRecords, arguments: triggers[index]);
                                },
                                child: Row(
                                  children: [
                                    Text(triggers[index].name!, style: AppStyles.bodyMedium,),
                                    const SizedBox(width: 8,),
                                    if (uniqueIconPaths.isNotEmpty)
                                    Expanded(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                          itemCount: uniqueIconPaths.length,
                                          itemBuilder: (BuildContext context, int iconIndex) =>
                                        Container(
                                          width: 60,
                                          height: 60,
                                          padding: const EdgeInsets.all(8),
                                          child: Image.asset(uniqueIconPaths[iconIndex]),
                                        )
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8,),
                        ],
                      ); 
                    }
                    ),
                    const Divider(height: 1, color: AppColors.secondary,),
                    const SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: Opacity(
                              opacity: 1,
                              child: CupertinoButton(
                                  color: AppColors.primary,
                                  disabledColor: AppColors.primary,
                                  borderRadius: BorderRadius.circular(64),
                                  onPressed: () {},
                                  child: Text('Add new trigger', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                            ),
                          ),
                    ),
                  ],
                );
              }
            },
          )
        ],
      )
      ),
    );
  }
}
