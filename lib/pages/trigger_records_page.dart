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

class TriggerRecordsPage extends StatelessWidget {
  TriggerState trigger;

  TriggerRecordsPage({
    super.key,
    required this.trigger
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocSelector<MoodsBloc, MoodsState, List<TriggerState>>(
            selector: (state) => state.triggers,
            builder: (context, triggers) {
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
                    ...List.generate(
                        trigger.iconsPath.length,
                            (index) => Image.asset(trigger.iconsPath[index])),
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
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('No records in this trigger yet', style: AppStyles.displayLarge),
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
