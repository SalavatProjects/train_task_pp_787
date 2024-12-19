import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pp_787/bloc/moods_bloc.dart';
import 'package:pp_787/bloc/trigger_state.dart';

import '../bloc/trigger_bloc.dart';
import '../gen/assets.gen.dart';
import '../ui_kit/app_colors.dart';
import '../ui_kit/app_styles.dart';
import '../utils/constants.dart';

class TriggerEmotionsPage extends StatefulWidget {
  TriggerState trigger;

  TriggerEmotionsPage({
    super.key,
    required this.trigger,
  });

  @override
  State<TriggerEmotionsPage> createState() => _TriggerEmotionsPageState();
}

class _TriggerEmotionsPageState extends State<TriggerEmotionsPage> {
  String? _currentIconPath;

  List<String> _iconPaths = [];
  @override
  void initState() {
    super.initState();
    _iconPaths = List.from(widget.trigger.iconsPath);
  }

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
                    const Text(
                      'Emotional trigger map', style: AppStyles.displaySmall,)
                  ],
                ),
                const SizedBox(height: 32,),
                    Center(
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: List.generate(
                            AppConstants.preMadeEmotions.length, (index)
                        => _EmotionCard(
                            iconPath: AppConstants.preMadeEmotions[index].$1,
                            isSelected: AppConstants.preMadeEmotions[index].$1 == _currentIconPath,
                            text: AppConstants.preMadeEmotions[index].$2,
                            onTap: () {
                              setState(() {
                                _currentIconPath = AppConstants.preMadeEmotions[index].$1;
                              });
                            }
                        )
                        ),
                      ),
                    ),
                const SizedBox(height: 32,),
                SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Opacity(
                        opacity: _currentIconPath != null
                            ? 1 : 0.65,
                        child: CupertinoButton(
                            color: AppColors.primary,
                            disabledColor: AppColors.primary,
                            borderRadius: BorderRadius.circular(64),
                            onPressed: _currentIconPath != null
                                ?
                                () {
                              _iconPaths.add(_currentIconPath!);
                              context.read<MoodsBloc>().updateTrigger(
                                  widget.trigger.id!,
                                  widget.trigger.copyWith(iconsPath: _iconPaths));
                              Navigator.of(context).pop();
                            } : null,
                            child: Text('Add new trigger', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                      ),
                    ),
              ],
            ),
          )),
    );
  }
}

class _EmotionCard extends StatelessWidget {
  final String text;
  final String iconPath;
  bool isSelected;
  void Function() onTap;

  _EmotionCard({
    super.key,
    required this.text,
    required this.iconPath,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 80) / 4,
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.surface,
                  border: isSelected ? Border.all(
                      color: AppColors.primary, width: 4) : null,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 16,
                        offset: const Offset(0, 4)
                    )
                  ]
              ),
              child: Image(image: AssetImage(iconPath)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              text, style: AppStyles.bodyMedium, textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}